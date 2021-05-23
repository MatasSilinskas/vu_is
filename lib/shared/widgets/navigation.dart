import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/pages/events/events.dart';
import 'package:vu_is/pages/study_results/study_results.dart';
import 'package:vu_is/shared/style/button_style.dart';

class Navigation extends StatefulWidget {
  final User user;

  Navigation({required this.user});

  @override
  NavigationState createState() => NavigationState(user: user);
}

class NavigationState<T> extends State<Navigation> {
  bool _isExpanded = false;
  User user;

  NavigationState({required this.user});

  @override
  Widget build(BuildContext context) {
    List<Widget> children;

    if (_isExpanded) {
      children = [
        TextButton.icon(
          style: VilniusUniversityButtonStyle.rightAlignedText(),
          onPressed: () {},
          icon: Text(user.name + ' ' + user.surname),
          label: Icon(Icons.person),
        ),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventsPage(user: user)),
            );
          },
          icon: Icon(Icons.bolt),
          label: Text(translate(Keys.Button_Navigation_Events)),
        ),
        _navigationItemDivider(),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {},
          icon: Icon(Icons.add_to_queue),
          label: Text(translate(Keys.Button_Navigation_Registrations)),
        ),
        _navigationItemDivider(),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {},
          icon: Icon(Icons.event_available),
          label: Text(translate(Keys.Button_Navigation_Exams)),
        ),
        _navigationItemDivider(),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudyResultsPage(
                        user: user,
                      )),
            );
          },
          icon: Icon(Icons.school),
          label: Text(translate(Keys.Button_Navigation_Results)),
        ),
        _navigationItemDivider(),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {},
          icon: Icon(Icons.edit),
          label: Text(translate(Keys.Button_Navigation_Requests)),
        ),
        _navigationItemDivider(),
        TextButton.icon(
          style: VilniusUniversityButtonStyle.leftAlignedText(),
          onPressed: () {},
          icon: Icon(Icons.settings),
          label: Text(translate(Keys.Button_Navigation_Settings)),
        ),
        _navigationItemDivider(),
        SizedBox(height: 20),
        TextButton.icon(
          style: VilniusUniversityButtonStyle(),
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          icon: Icon(Icons.arrow_downward),
          label: Text(translate(Keys.Button_Navigation_Menu)),
        ),
      ];
    } else {
      children = [
        TextButton.icon(
          style: VilniusUniversityButtonStyle(),
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          icon: Icon(Icons.arrow_upward),
          label: Text(translate(Keys.Button_Navigation_Menu)),
        ),
      ];
    }

    return IntrinsicHeight(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        IntrinsicHeight(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children))
      ],
    ));
  }
}

Divider _navigationItemDivider() {
  return Divider(
    color: Colors.white,
    height: 1,
    thickness: 2,
    indent: 40,
    endIndent: 80,
  );
}
