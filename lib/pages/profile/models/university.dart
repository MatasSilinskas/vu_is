import 'package:vu_is/pages/profile/models/faculty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university.g.dart';

@JsonSerializable()
class University {
  final String name;
  final Faculty faculty;

  University({required this.name, required this.faculty});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}