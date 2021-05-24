import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/user.dart';

class ProfileInformation extends Container {
  final User user;

  ProfileInformation({required this.user});

  @override
  EdgeInsetsGeometry? get padding => EdgeInsets.all(20);

  @override
  Widget? get child => Column(
    children: [
      Row(
        children: [
          Expanded(child: Text(translate(Keys.Person_Home_Country))),
          Expanded(child: Text(user.getCountry())),
        ],
      ),
      SizedBox(height: 5),
      Row(
        children: [
          Expanded(child: Text(translate(Keys.Person_Foreign_Language_1))),
          Expanded(child: Text(user.getFirstForeignLanguage())),
        ],
      ),
    ],
  );
}
