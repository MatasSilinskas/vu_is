import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';

@JsonSerializable()
class Semester {
  @JsonKey(fromJson: _stringFromDocumentReference, toJson: _documentReferenceFromString)
  final String id;
  final int identifier;

  Semester({required this.identifier, required this.id});

  factory Semester.fromJson(Map<String, dynamic> json) => _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);

  static String _stringFromDocumentReference(DocumentReference reference) => reference.id;
  static DocumentReference _documentReferenceFromString(String id) => FirebaseFirestore.instance.collection('semesters').doc(id);
}
