import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user}) : super();

  @override
  _ProfilePageState createState() => _ProfilePageState(user: this.user);
}

class _ProfilePageState extends State<ProfilePage> {
  final User user;

  _ProfilePageState({required this.user});

  @override
  Widget build(BuildContext context) {
    return VuTabController(
      user: this.user,
      title: Keys.Window_Profile,
      tabs: [
        Tab(text: translate(Keys.Tabs_Studyinformation)),
        Tab(text: translate(Keys.Tabs_Userinformation)),
      ],
      bodies: [
        Scaffold(
            body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                translate(Keys.Student_Title, args: {'studentNr': user.studentNumber}),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(user.study.getExtendedType()),
              Text(user.study.university.faculty.getName()),
              Text(user.study.getDescription()),
              Text(user.study.getProgressDescription()),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(user.study.getFinanceInformation()),
              ),
              SizedBox(height: 20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(translate(Keys.Studies_Start))),
                  Expanded(child: Text(user.study.start.year.toString())),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(translate(Keys.Studies_Plannedend))),
                  Expanded(child: Text(DateFormat('yyyy-MM-dd').format(user.study.plannedEnd))),
                ],
              ),
              SizedBox(height: 20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(translate(Keys.Studies_Language))),
                  Expanded(child: Text(translate(user.study.getLanguage()))),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(translate(Keys.Student_Acceptedgrade))),
                  Expanded(child: Text(user.study.acceptedGrade.toString())),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(translate(Keys.Student_Status_Label))),
                  Expanded(child: Text(user.getStatus())),
                ],
              ),
            ],
          ),
        )),
        Scaffold(),
      ],
    );
  }
}
