// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) {
  return Semester(
    identifier: json['identifier'] as int,
    id: Semester._stringFromDocumentReference(
        json['id'] as DocumentReference<Object?>),
  );
}

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': Semester._documentReferenceFromString(instance.id),
      'identifier': instance.identifier,
    };
