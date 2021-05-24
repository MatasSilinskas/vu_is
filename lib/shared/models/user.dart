import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/shared/models/study.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String name;
  final String surname;
  final String semesterId;
  final String status;
  final int studentNumber;
  final Study study;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.surname,
    required this.semesterId,
    required this.studentNumber,
    required this.study,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getStatus() => translate('student.status.' + this.status);
}
