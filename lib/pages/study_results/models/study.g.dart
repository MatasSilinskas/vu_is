// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Study _$StudyFromJson(Map<String, dynamic> json) {
  return Study(
    direction: json['direction'] as String,
    university: University.fromJson(json['university'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'direction': instance.direction,
      'university': instance.university,
    };
