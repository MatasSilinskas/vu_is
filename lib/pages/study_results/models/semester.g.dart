// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) {
  return Semester(
    id: json['id'] as String,
    maxCredits: json['maxCredits'] as int,
    obtainedCredits: json['obtainedCredits'] as int,
    grade: json['grade'] as int,
    identifier: json['identifier'] as int,
  );
}

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'maxCredits': instance.maxCredits,
      'obtainedCredits': instance.obtainedCredits,
      'grade': instance.grade,
      'id': instance.id,
      'identifier': instance.identifier,
    };
