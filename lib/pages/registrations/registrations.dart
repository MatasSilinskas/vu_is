import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/registrations/models/registration.dart';
import 'package:vu_is/pages/registrations/models/upcoming_registration.dart';
import 'package:vu_is/pages/registrations/widgets/empty_registration.dart';
import 'package:vu_is/pages/registrations/widgets/registration_tile.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';

import 'models/selected_subject.dart';

class RegistrationsPage extends StatefulWidget {
  final User user;

  RegistrationsPage({required this.user}) : super();

  @override
  _RegistrationsPageState createState() => _RegistrationsPageState(user: this.user);
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  final User user;
  String? selectedSemesterId;
  String? searchQuery;

  _RegistrationsPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    CollectionReference userRegistrations =
        FirebaseFirestore.instance.collection('users/' + this.user.id + '/registrations');
    CollectionReference semesters = FirebaseFirestore.instance.collection('semesters');
    CollectionReference upcomingRegistrations =
        FirebaseFirestore.instance.collection('users/' + this.user.id + '/upcoming-registrations');

    return VuTabController(
      user: this.user,
      title: Keys.Registrations_Titles_Listviews,
      tabs: [
        Tab(text: translate(Keys.Registrations_Tabs_Current)),
        Tab(text: translate(Keys.Registrations_Tabs_Previous)),
      ],
      bodies: [
        Scaffold(
          body: StreamBuilder<QuerySnapshot>(
              stream: upcomingRegistrations.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(translate(Keys.Errors_Unknown));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return new VuDataLoader();
                }

                List<UpcomingRegistration> upcomingRegistrations = UpcomingRegistration.fromSnapshot(snapshot);
                List<SelectedSubject> selectedSubjects = [];
                for (UpcomingRegistration registration in upcomingRegistrations) {
                  var subjects = registration.subjects.where((element) => element.isSelected);

                  if (subjects.isNotEmpty) {
                    selectedSubjects.add(subjects.first);
                  }
                }

                if (selectedSubjects.isEmpty) {
                  return EmptyRegistration(
                    context: context,
                    upcomingRegistrations: upcomingRegistrations,
                    user: user,
                  );
                }

                return Container();
              }),
        ),
        Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: userRegistrations.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(translate(Keys.Errors_Unknown));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return new VuDataLoader();
            }

            List<Registration> registrationData = snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  return new Registration.fromJson(document.data() as Map<String, dynamic>);
                })
                .where((Registration element) =>
                    this.selectedSemesterId == null || element.semester.id == this.selectedSemesterId)
                .where((Registration element) =>
                    this.searchQuery == null ||
                    element.subject.toString().contains(this.searchQuery!) ||
                    element.subject.professor.getFullName().contains(this.searchQuery!))
                .toList();

            Container searchField = new Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: new Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFF690335),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: translate(Keys.Registrations_Labels_Search),
                        border: new OutlineInputBorder(),
                        focusedBorder: new OutlineInputBorder(),
                      ),
                      initialValue: searchQuery,
                      onFieldSubmitted: _searchRegistrations,
                    ),
                  ),
                ],
              ),
            );

            Container semesterDropdown = new Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                new Text(translate(Keys.Studies_Semesters)),
                new StreamBuilder(
                    stream: semesters
                        .where('user', isEqualTo: FirebaseFirestore.instance.collection('users').doc(user.id))
                        .orderBy('identifier')
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text(translate(Keys.Errors_Unknown));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return new VuDataLoader();
                      }

                      return _buildSemesterDropdown(snapshot);
                    }),
              ]),
            );

            return ListView(
                padding: EdgeInsets.only(top: 20),
                children: [searchField, semesterDropdown] +
                    registrationData.map(
                      (Registration registration) {
                        return new Container(
                            child: new Card(child: RegistrationTile.fromRegistration(registration, context)));
                      },
                    ).toList());
          },
        )),
      ],
    );
  }

  DropdownButtonHideUnderline _buildSemesterDropdown(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Semester> semesterData = _getSemesterDataFromSnapshot(snapshot);

    return new DropdownButtonHideUnderline(
        child: new Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(translate(Keys.Registrations_Labels_Semesternotchosen)),
        ),
        value: selectedSemesterId,
        icon: new Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: (String? newValue) {
          setState(() {
            selectedSemesterId = newValue!;
          });
        },
        items: semesterData.map((Semester semester) {
          return DropdownMenuItem<String>(
            value: semester.id,
            child: Padding(padding: EdgeInsets.only(left: 10), child: Text(semester.toString())),
          );
        }).toList(),
      ),
    ));
  }

  List<Semester> _getSemesterDataFromSnapshot(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      var documentData = document.data() as Map<String, dynamic>;
      documentData.addAll({'id': document.id});

      return new Semester.fromJson(documentData);
    }).toList();
  }

  void _searchRegistrations(String? newValue) {
    setState(() {
      searchQuery = newValue!;
    });
  }
}
