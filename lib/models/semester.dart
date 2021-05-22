import 'package:vu_is/models/grade.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';

@JsonSerializable()
class Semester extends Grade {
  final int identifier;

  Semester(
      {required int maxCredits,
      required int obtainedCredits,
      required int grade,
      required this.identifier})
      : super(maxCredits, obtainedCredits, grade);

  factory Semester.fromJson(Map<String, dynamic> json) => _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
