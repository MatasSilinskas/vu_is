import 'package:json_annotation/json_annotation.dart';

part 'professor.g.dart';

@JsonSerializable()
class Professor {
  final String email;
  final String name;
  final String surname;

  Professor({required this.email, required this.name, required this.surname});

  factory Professor.fromJson(Map<String, dynamic> json) => _$ProfessorFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessorToJson(this);

  String getFullName() {
    return this.name + ' ' + this.surname;
  }
}
