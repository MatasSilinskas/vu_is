import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faculty.g.dart';

@JsonSerializable()
class Faculty {
  final String name;

  Faculty({required this.name});

  factory Faculty.fromJson(Map<String, dynamic> json) => _$FacultyFromJson(json);

  Map<String, dynamic> toJson() => _$FacultyToJson(this);

  String getName() => translate('universities.faculties.name.' + this.name);
}
