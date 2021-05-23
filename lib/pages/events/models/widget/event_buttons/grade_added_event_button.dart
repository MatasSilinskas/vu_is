import 'package:flutter/material.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/events/models/widget/event_button.dart';
import 'package:vu_is/pages/study_results/study_results.dart';
import 'package:vu_is/shared/models/user.dart';

class GradeAddedEventButton extends EventButton {
  final BuildContext context;

  GradeAddedEventButton({required this.context, required User user})
      : super(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudyResultsPage(
                          user: user,
                        )),
              );
            },
            translationKey: Keys.Button_Event_Action_Grade_Added);
}
