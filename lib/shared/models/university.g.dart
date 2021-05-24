// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) {
  return University(
    name: json['name'] as String,
    faculty: Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'name': instance.name,
      'faculty': instance.faculty,
    };
