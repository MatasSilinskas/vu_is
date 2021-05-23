import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/study_results/models/professor.dart';
import 'package:vu_is/shared/models/subject.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject extends TranslatableSubject {
  final Professor professor;

  Subject({required String type, required this.professor}) : super(type);

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
