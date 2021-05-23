import 'package:flutter/material.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

class VuDataLoader extends Center {
  @override
  Widget? get child => Row(mainAxisSize: MainAxisSize.min, children: [
        new CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF690335)),
        ),
        Container(width: 20, height: 20),
        new Text(translate(Keys.Custom_Loading)),
      ]);
}
