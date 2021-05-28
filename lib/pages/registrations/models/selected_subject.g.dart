// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedSubject _$SelectedSubjectFromJson(Map<String, dynamic> json) {
  return SelectedSubject(
    expectedStudents: json['expectedStudents'] as int,
    maxAllowed: json['maxAllowed'] as int,
    credits: json['credits'] as int,
    type: json['type'] as String,
    professor: Professor.fromJson(json['professor'] as Map<String, dynamic>),
    isSelected: json['isSelected'] as bool,
  );
}

Map<String, dynamic> _$SelectedSubjectToJson(SelectedSubject instance) =>
    <String, dynamic>{
      'isSelected': instance.isSelected,
      'credits': instance.credits,
      'type': instance.type,
      'professor': SelectedSubject._professorToJson(instance.professor),
      'expectedStudents': instance.expectedStudents,
      'maxAllowed': instance.maxAllowed,
    };
