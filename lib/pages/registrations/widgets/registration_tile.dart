import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/pages/registrations/models/registration.dart';
import 'package:vu_is/localization/keys.dart';

class RegistrationTile extends ExpansionTile {
  RegistrationTile.fromRegistration(Registration registration, BuildContext context)
      : super(
          leading: new SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: new Center(
                child: Text(
              registration.type.toString().toUpperCase(),
              style: TextStyle(fontSize: 21, color: Colors.black),
            )),
          ),
          trailing: new Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF690335),
            size: 38,
          ),
          children: [
            new Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.225,
                  child: new Center(
                      child: new Text(registration.group != null
                          ? translate(Keys.Registrations_Labels_Group) +
                              ' ' +
                              registration.group.toString().toUpperCase()
                          : '')),
                ),
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.745,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(registration.subject.professor.getFullName()),
                      new SizedBox(height: 5),
                      new Text(
                          translate(Keys.Registrations_Labels_Credits) + ' ' + registration.subject.credits.toString()),
                      new SizedBox(height: 5),
                      new Text(translate(Keys.Registrations_Labels_Semester) +
                          ' ' +
                          registration.semester.identifier.toString()),
                      new SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ],
          title: new Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: new Text(
                registration.subject.toString(),
                style: TextStyle(color: Colors.black),
              )),
        );
}
