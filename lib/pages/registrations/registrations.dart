import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/registrations/models/registration.dart';
import 'package:vu_is/pages/registrations/widgets/registration_tile.dart';
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

  _RegistrationsPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    CollectionReference userRegistrations =
        FirebaseFirestore.instance.collection('users/' + this.user.id + '/registrations');

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

            List<Registration> registrationData = snapshot.data!.docs.map((DocumentSnapshot document) {
              return new Registration.fromJson(document.data() as Map<String, dynamic>);
            }).toList();

            return ListView(
                children: (registrationData.map(
              (Registration registration) {
                return new Container(child: new Card(child: RegistrationTile.fromRegistration(registration, context)));
              },
            ).toList()));
          },
        )),
      ],
    );
  }
}
