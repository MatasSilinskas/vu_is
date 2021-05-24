// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Study _$StudyFromJson(Map<String, dynamic> json) {
  return Study(
    course: json['course'] as int,
    group: json['group'] as int,
    semester: json['semester'] as int,
    direction: json['direction'] as String,
    form: json['form'] as String,
    stage: json['stage'] as String,
    start: Study._dateTimeFromTimestamp(json['start'] as Timestamp),
    plannedEnd: Study._dateTimeFromTimestamp(json['plannedEnd'] as Timestamp),
    university: University.fromJson(json['university'] as Map<String, dynamic>),
    type: json['type'] as String,
    finance: json['finance'] as String,
    language: json['language'] as String,
    acceptedGrade: json['acceptedGrade'] as int,
  );
}

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'course': instance.course,
      'group': instance.group,
      'semester': instance.semester,
      'acceptedGrade': instance.acceptedGrade,
      'direction': instance.direction,
      'form': instance.form,
      'stage': instance.stage,
      'type': instance.type,
      'finance': instance.finance,
      'language': instance.language,
      'university': instance.university,
      'start': Study._dateTimeToTimestamp(instance.start),
      'plannedEnd': Study._dateTimeToTimestamp(instance.plannedEnd),
    };
