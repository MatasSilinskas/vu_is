// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingRegistration _$UpcomingRegistrationFromJson(Map<String, dynamic> json) {
  return UpcomingRegistration(
    id: json['id'] as String,
    type: json['type'] as String,
    group: json['group'] as String?,
    subjects: (json['subjects'] as List<dynamic>)
        .map((e) => SelectedSubject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UpcomingRegistrationToJson(
        UpcomingRegistration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'type': instance.type,
      'subjects': instance.subjects,
    };
