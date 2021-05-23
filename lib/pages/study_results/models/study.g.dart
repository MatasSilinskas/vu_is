// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Study _$StudyFromJson(Map<String, dynamic> json) {
  return Study(
    type: json['type'] as String,
    university: University.fromJson(json['university'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'type': instance.type,
      'university': instance.university,
    };
