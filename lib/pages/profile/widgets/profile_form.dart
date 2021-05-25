import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/user.dart';

class ProfileForm extends Form {
  final User user;

  ProfileForm({required this.user})
      : super(
          child: Column(
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: Text(translate(Keys.Person_Name_Label))),
              FocusScope(
                canRequestFocus: false,
                node: FocusScopeNode(),
                child: TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    labelText: user.name,
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(alignment: Alignment.centerLeft, child: Text(translate(Keys.Person_Surname_Label))),
              FocusScope(
                canRequestFocus: false,
                node: FocusScopeNode(),
                child: TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    labelText: user.surname,
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(alignment: Alignment.centerLeft, child: Text(translate(Keys.Person_Nationality))),
              FocusScope(
                canRequestFocus: false,
                node: FocusScopeNode(),
                child: TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    labelText: user.getTranslatedNationality(),
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(alignment: Alignment.centerLeft, child: Text(translate(Keys.Person_Gender_Label))),
              FocusScope(
                canRequestFocus: false,
                node: FocusScopeNode(),
                child: TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    labelText: user.getTranslatedGender(),
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(alignment: Alignment.centerLeft, child: Text(translate(Keys.Person_Address_Label))),
              FocusScope(
                canRequestFocus: false,
                node: FocusScopeNode(),
                child: TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    labelText: user.address.getShortDescription(),
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        );
}
