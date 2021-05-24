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
  final String country;
  final String firstForeignLanguage;
  final String gender;
  final String nationality;
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
    required this.country,
    required this.firstForeignLanguage,
    required this.gender,
    required this.nationality,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getStatus() => translate('student.status.' + this.status);
  String getCountry() => translate('countries.' + this.country);
  String getFirstForeignLanguage() => translate('languages.' + this.firstForeignLanguage);
}
