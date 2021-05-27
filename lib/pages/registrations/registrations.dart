import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/registrations/models/registration.dart';
import 'package:vu_is/pages/registrations/widgets/registration_tile.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';

class RegistrationsPage extends StatefulWidget {
  final User user;

  RegistrationsPage({required this.user}) : super();

  @override
  _RegistrationsPageState createState() => _RegistrationsPageState(user: this.user);
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  final User user;
  String? selectedSemesterId;

  _RegistrationsPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    CollectionReference userRegistrations =
        FirebaseFirestore.instance.collection('users/' + this.user.id + '/registrations');
    CollectionReference semesters = FirebaseFirestore.instance.collection('semesters');

    return VuTabController(
      user: this.user,
      title: Keys.Registrations_Titles_Listviews,
      tabs: [
        Tab(text: translate(Keys.Registrations_Tabs_Current)),
        Tab(
          text: translate(Keys.Registrations_Tabs_Previous),
        ),
      ],
      bodies: [
        Scaffold(),
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
                .toList();

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
                children: [semesterDropdown] +
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
      height: 39,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(translate(Keys.Registrations_Labels_Semesternotchosen)),
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
}
