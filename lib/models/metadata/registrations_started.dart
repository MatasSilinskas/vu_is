import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/models/metadata.dart';

class RegistrationsStarted extends Metadata {
  RegistrationsStarted();

  @override
  String toString() => translate(Keys.Event_Registrations_Started);
}
