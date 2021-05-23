import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/pages/study_results/models/study.dart';
import 'package:vu_is/pages/study_results/models/grade.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/study_results/models/subject.dart';

part 'subject_grade.g.dart';

@JsonSerializable()
class SubjectGrade extends Grade {
  final Study study;
  final Subject subject;
  final String type;

  SubjectGrade(
      {required int maxCredits,
      required int obtainedCredits,
      required int grade,
      required this.subject,
      required this.study,
      required this.type})
      : super(maxCredits, obtainedCredits, grade);

  factory SubjectGrade.fromJson(Map<String, dynamic> json) =>
      _$SubjectGradeFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectGradeToJson(this);

  @override
  String toString() => translate('subject.type.' + this.type, args: {
        'universityName': this.study.university.toString(),
        'studyName': this.study.toString()
      });
}
