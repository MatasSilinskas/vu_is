import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/shared/models/professor.dart';
import 'package:vu_is/shared/models/subject.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject extends TranslatableSubject {
  final int credits;
  final String type;
  final Professor professor;

  Subject({
    required this.credits,
    required this.type,
    required this.professor,
  }) : super(type);

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
