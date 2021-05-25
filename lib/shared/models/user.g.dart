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
    country: json['country'] as String,
    firstForeignLanguage: json['firstForeignLanguage'] as String,
    gender: json['gender'] as String,
    nationality: json['nationality'] as String,
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'semesterId': instance.semesterId,
      'country': instance.country,
      'firstForeignLanguage': instance.firstForeignLanguage,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'address': instance.address,
    };
