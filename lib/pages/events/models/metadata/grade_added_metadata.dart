import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/events/models/metadata.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/pages/events/models/metadata/subject.dart';

part 'grade_added_metadata.g.dart';

@JsonSerializable()
class GradeAddedMetadata extends Metadata {
  final int grade;
  final Subject subject;

  GradeAddedMetadata({required this.grade, required this.subject});

  factory GradeAddedMetadata.fromJson(Map<String, dynamic> json) =>
      _$GradeAddedMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$GradeAddedMetadataToJson(this);

  @override
  String toString() => translate(Keys.Event_Grade_Added,
      args: {'subject': this.subject.toString(), 'grade': this.grade});
}
