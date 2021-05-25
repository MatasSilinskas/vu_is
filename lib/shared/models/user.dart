import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/shared/models/address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String name;
  final String surname;
  final String semesterId;
  final String country;
  final String firstForeignLanguage;
  final String gender;
  final String nationality;
  final Address address;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.surname,
    required this.semesterId,
    required this.country,
    required this.firstForeignLanguage,
    required this.gender,
    required this.nationality,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getTranslatedCountry() => translate('countries.' + this.country);
  String getTranslatedFirstForeignLanguage() => translate('languages.' + this.firstForeignLanguage);
  String getTranslatedNationality() => translate('nationalities.' + this.nationality);
  String getTranslatedGender() => translate('genders.' + this.gender);
}
