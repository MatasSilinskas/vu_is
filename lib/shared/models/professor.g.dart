// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Professor _$ProfessorFromJson(Map<String, dynamic> json) {
  return Professor(
    email: json['email'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
  );
}

Map<String, dynamic> _$ProfessorToJson(Professor instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
    };
