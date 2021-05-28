import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/new_registration/new_registration.dart';
import 'package:vu_is/pages/registrations/models/upcoming_registration.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/style/button_style.dart';

class EmptyRegistration extends Container {
  EmptyRegistration({
    required BuildContext context,
    required List<UpcomingRegistration> upcomingRegistrations,
    required User user,
  }) : super(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning, color: Colors.yellow),
                    SizedBox(width: 8),
                    Expanded(child: Text(translate(Keys.Registrations_Information_Empty_Ongoing))),
                  ],
                ),
                SizedBox(height: 15),
                TextButton(
                  style: VilniusUniversityButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewRegistrationPage(upcomingRegistrations: upcomingRegistrations, user: user),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(translate(Keys.Registrations_Buttons_Start_Registrations)),
                  ),
                ),
              ],
            )));
}
