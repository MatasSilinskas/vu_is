import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';

@JsonSerializable()
class Semester {
  final int identifier;

  Semester({required this.identifier});

  factory Semester.fromJson(Map<String, dynamic> json) => _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}