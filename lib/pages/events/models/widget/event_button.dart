import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/pages/events/models/widget/event_buttons/grade_added_event_button.dart';
import 'package:vu_is/pages/events/models/widget/event_buttons/registrations_reminder_button.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/style/button_style.dart';

import '../event.dart';

abstract class EventButton extends TextButton {
  @override
  ButtonStyle? get style => VilniusUniversityButtonStyle();

  EventButton({required VoidCallback onPressed, required String translationKey})
      : super(onPressed: onPressed, child: new Text(translate(translationKey)));

  factory EventButton.create(Event event, User user, BuildContext context) {
    switch (event.type) {
      case Event.typeGradeAdded:
        return new GradeAddedEventButton(context: context, user: user);
      case Event.typeRegistrationsIncoming:
      case Event.typeRegistrationsStarted:
        return new RegistrationsReminderButton();
    }

    throw new Exception('Not implemented');
  }
}
