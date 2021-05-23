import 'package:json_annotation/json_annotation.dart';

part 'university.g.dart';

@JsonSerializable()
class University {
  final String name;

  University({required this.name});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}
