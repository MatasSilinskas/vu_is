// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectGrade _$SubjectGradeFromJson(Map<String, dynamic> json) {
  return SubjectGrade(
    maxCredits: json['maxCredits'] as int,
    obtainedCredits: json['obtainedCredits'] as int,
    grade: json['grade'] as int,
    subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
    study: Study.fromJson(json['study'] as Map<String, dynamic>),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$SubjectGradeToJson(SubjectGrade instance) =>
    <String, dynamic>{
      'maxCredits': instance.maxCredits,
      'obtainedCredits': instance.obtainedCredits,
      'grade': instance.grade,
      'study': instance.study,
      'subject': instance.subject,
      'type': instance.type,
    };
