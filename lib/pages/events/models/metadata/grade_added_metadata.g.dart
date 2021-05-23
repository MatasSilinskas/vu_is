// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_added_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradeAddedMetadata _$GradeAddedMetadataFromJson(Map<String, dynamic> json) {
  return GradeAddedMetadata(
    grade: json['grade'] as int,
    subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GradeAddedMetadataToJson(GradeAddedMetadata instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'subject': instance.subject,
    };
