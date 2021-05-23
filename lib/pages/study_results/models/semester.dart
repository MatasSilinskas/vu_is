import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/grade.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';

@JsonSerializable()
class Semester extends Grade {
  final String id;
  final int identifier;

  Semester(
      {required this.id,
      required int maxCredits,
      required int obtainedCredits,
      required int grade,
      required this.identifier})
      : super(maxCredits, obtainedCredits, grade);

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);

  @override
  String toString() {
    return translate(Keys.Studies_Semestername,
        args: {'identifier': this.identifier});
  }
}
