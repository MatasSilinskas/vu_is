import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/shared/models/user.dart';

import 'navigation.dart';

class VuTabController extends DefaultTabController {
  final User user;

  VuTabController(
      {required this.user,
      required List<Widget> tabs,
      required List<Widget> bodies,
      required String title})
      : super(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                translate(title),
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              bottom: TabBar(
                tabs: tabs,
                labelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 16),
                indicatorColor: Color(0xFF690335),
              ),
              backgroundColor: Colors.white,
              leading: BackButton(color: new Color(0xFF919191)),
            ),
            body: TabBarView(
              children: bodies,
            ),
            bottomNavigationBar: new BottomAppBar(
                color: Color(0xFF690335),
                child: Navigation(
                  user: user,
                )),
          ),
        );
}
