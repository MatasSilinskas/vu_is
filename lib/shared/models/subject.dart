import 'package:flutter_translate/flutter_translate.dart';

class TranslatableSubject {
  final String type;

  TranslatableSubject(this.type);

  @override
  String toString() => translate('subject.title.' + this.type);
}
