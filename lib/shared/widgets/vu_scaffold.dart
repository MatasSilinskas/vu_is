import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/shared/models/user.dart';

import 'navigation.dart';

class VuScaffold extends Scaffold {
  final String title;
  final User user;

  @override
  PreferredSizeWidget? get appBar => AppBar(
        title: Text(
          translate(this.title),
          style: TextStyle(color: Color(0xFF000000), fontSize: 24),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        leading: BackButton(color: new Color(0xFF919191)),
      );

  @override
  Widget? get bottomNavigationBar => new BottomAppBar(
      color: Color(0xFF690335),
      child: Navigation(
        user: this.user,
      ));

  VuScaffold(
      {required this.user,
      required this.title,
      required Widget body,
      List<Widget>? tabs})
      : super(body: body);
}
