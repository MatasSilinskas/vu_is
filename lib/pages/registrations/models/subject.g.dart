// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(
    credits: json['credits'] as int,
    type: json['type'] as String,
    professor: Professor.fromJson(json['professor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'credits': instance.credits,
      'type': instance.type,
      'professor': instance.professor,
    };
