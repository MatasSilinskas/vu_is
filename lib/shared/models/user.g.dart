// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    semesterId: json['semesterId'] as String,
    studentNumber: json['studentNumber'] as int,
    study: Study.fromJson(json['study'] as Map<String, dynamic>),
    status: json['status'] as String,
    country: json['country'] as String,
    firstForeignLanguage: json['firstForeignLanguage'] as String,
    gender: json['gender'] as String,
    nationality: json['nationality'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'semesterId': instance.semesterId,
      'status': instance.status,
      'country': instance.country,
      'firstForeignLanguage': instance.firstForeignLanguage,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'studentNumber': instance.studentNumber,
      'study': instance.study,
    };
