import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/shared/models/professor.dart';
import 'package:vu_is/shared/models/subject.dart';

part 'selected_subject.g.dart';

@JsonSerializable()
class SelectedSubject extends TranslatableSubject {
  bool isSelected;
  final int credits;
  final String type;
  @JsonKey(toJson: _professorToJson)
  final Professor professor;
  final int expectedStudents;
  final int maxAllowed;

  SelectedSubject({
    required this.expectedStudents,
    required this.maxAllowed,
    required this.credits,
    required this.type,
    required this.professor,
    required this.isSelected,
  }) : super(type);

  factory SelectedSubject.fromJson(Map<String, dynamic> json) => _$SelectedSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedSubjectToJson(this);

  Map<String, dynamic> toJsonMap() => {this.type: this.toJson()};

  static Map<String, dynamic> _professorToJson(Professor professor) => professor.toJson();
}
