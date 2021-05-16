import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/models/metadata.dart';

class RegistrationsIncoming extends Metadata {
  RegistrationsIncoming();

  @override
  String toString() => translate(Keys.Event_Registrations_Incoming);
}