// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStudy _$UserStudyFromJson(Map<String, dynamic> json) {
  return UserStudy(
    course: json['course'] as int,
    group: json['group'] as int,
    semester: json['semester'] as int,
    direction: json['direction'] as String,
    form: json['form'] as String,
    stage: json['stage'] as String,
    start: UserStudy._dateTimeFromTimestamp(json['start'] as Timestamp),
    plannedEnd:
        UserStudy._dateTimeFromTimestamp(json['plannedEnd'] as Timestamp),
    university: University.fromJson(json['university'] as Map<String, dynamic>),
    type: json['type'] as String,
    finance: json['finance'] as String,
    language: json['language'] as String,
    acceptedGrade: json['acceptedGrade'] as int,
    status: json['status'] as String,
    studentNumber: json['studentNumber'] as int,
  );
}

Map<String, dynamic> _$UserStudyToJson(UserStudy instance) => <String, dynamic>{
      'course': instance.course,
      'group': instance.group,
      'semester': instance.semester,
      'acceptedGrade': instance.acceptedGrade,
      'studentNumber': instance.studentNumber,
      'direction': instance.direction,
      'form': instance.form,
      'stage': instance.stage,
      'type': instance.type,
      'finance': instance.finance,
      'language': instance.language,
      'university': instance.university,
      'status': instance.status,
      'start': UserStudy._dateTimeToTimestamp(instance.start),
      'plannedEnd': UserStudy._dateTimeToTimestamp(instance.plannedEnd),
    };
