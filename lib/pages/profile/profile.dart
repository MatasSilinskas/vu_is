import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/profile/models/user_study.dart';
import 'package:vu_is/pages/profile/widgets/profile_form.dart';
import 'package:vu_is/pages/profile/widgets/profile_information.dart';
import 'package:vu_is/pages/profile/widgets/student_information.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
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
    CollectionReference userStudy = FirebaseFirestore.instance.collection('userStudies');

    return VuTabController(
      user: this.user,
      title: Keys.Window_Profile,
      tabs: [
        Tab(text: translate(Keys.Tabs_Studyinformation)),
        Tab(text: translate(Keys.Tabs_Userinformation)),
      ],
      bodies: [
        Scaffold(
          body: StreamBuilder<QuerySnapshot>(
              stream: userStudy
                  .where('user', isEqualTo: FirebaseFirestore.instance.collection('users').doc(user.id))
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(translate(Keys.Errors_Unknown));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return new VuDataLoader();
                }

                return new StudentInformation(
                  userStudy: UserStudy.fromJson(snapshot.data!.docs.first.data() as Map<String, dynamic>),
                );
              }),
        ),
        Scaffold(
          body: Column(
            children: [
              ProfileInformation(user: user),
              Divider(
                color: new Color(0xFFD1D1D1),
                height: 2,
                thickness: 1.5,
              ),
              Padding(padding: EdgeInsets.all(20), child: ProfileForm(user: user))
            ],
          ),
        ),
      ],
    );
  }
}
