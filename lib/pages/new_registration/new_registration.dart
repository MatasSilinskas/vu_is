import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/registrations/models/upcoming_registration.dart';
import 'package:vu_is/pages/registrations/registrations.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/style/button_style.dart';
import 'package:vu_is/shared/widgets/vu_scaffold.dart';

class NewRegistrationPage extends StatefulWidget {
  final List<UpcomingRegistration> upcomingRegistrations;
  final User user;

  NewRegistrationPage({required this.upcomingRegistrations, required this.user}) : super();

  @override
  _NewRegistrationPageState createState() => _NewRegistrationPageState(
      upcomingRegistrations: this.upcomingRegistrations,
      selectedRegistration: upcomingRegistrations.first,
      user: this.user);
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  final List<UpcomingRegistration> upcomingRegistrations;
  UpcomingRegistration selectedRegistration;
  final User user;

  _NewRegistrationPageState(
      {required this.upcomingRegistrations, required this.selectedRegistration, required this.user});

  @override
  Widget build(BuildContext context) {
    return VuScaffold(
      user: user,
      title: translate(Keys.Registrations_Titles_Newregistration),
      body: ListView(
        children: [
              new Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(translate(Keys.Registrations_Labels_Chooseonesubject)),
                    ),
                  ],
                ),
              ),
            ] +
            _buildSubjectCards() +
            [
              new Container(
                padding: EdgeInsets.only(top: 30),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: VilniusUniversityButtonStyle(),
                      onPressed: () {
                        List<Map<String, dynamic>> subjects =
                            selectedRegistration.subjects.map((e) => e.toJson()).toList();
                        FirebaseFirestore.instance
                            .doc('users/${user.id}/upcoming-registrations/${selectedRegistration.id}')
                            .update({'subjects': subjects}).then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationsPage(user: user),
                                )));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text(translate(Keys.Registrations_Buttons_Save)),
                      ),
                    ),
                  ],
                ),
              )
            ],
      ),
    );
  }

  List<Container> _buildSubjectCards() {
    return selectedRegistration.subjects
        .map(
          (subject) => Container(
              child: Card(
            child: Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(children: [
                      SizedBox(height: 5),
                      Align(alignment: Alignment.centerLeft, child: Text(subject.toString())),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(translate(Keys.Registrations_Labels_Takenplaces) +
                            ' ' +
                            subject.expectedStudents.toString() +
                            '/' +
                            subject.maxAllowed.toString()),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            translate(Keys.Registrations_Labels_Professor) + ' ' + subject.professor.getFullName()),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(translate(Keys.Registrations_Labels_Credits) + ' ' + subject.credits.toString()),
                      ),
                      SizedBox(height: 5),
                    ])),
                    Switch(
                      activeColor: Color(0xFF690335),
                      value: subject.isSelected,
                      onChanged: (value) {
                        setState(() {
                          subject.isSelected = value;
                        });
                      },
                    )
                  ],
                )),
          )),
        )
        .toList();
  }
}
