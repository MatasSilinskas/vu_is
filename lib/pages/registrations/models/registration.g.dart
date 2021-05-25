// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registration _$RegistrationFromJson(Map<String, dynamic> json) {
  return Registration(
    acceptedSlots: json['acceptedSlots'] as int,
    maxAllowed: json['maxAllowed'] as int,
    type: json['type'] as String,
    semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
    group: json['group'] as String?,
  );
}

Map<String, dynamic> _$RegistrationToJson(Registration instance) =>
    <String, dynamic>{
      'acceptedSlots': instance.acceptedSlots,
      'maxAllowed': instance.maxAllowed,
      'group': instance.group,
      'type': instance.type,
      'semester': instance.semester,
      'subject': instance.subject,
    };
