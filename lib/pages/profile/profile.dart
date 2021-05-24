import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/profile/widgets/student_information.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';

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
        StudentInformation(user: user),
        Scaffold(),
      ],
    );
  }
}
