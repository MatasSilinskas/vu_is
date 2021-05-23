import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String name;
  final String surname;
  final String semesterId;

  User(
      {required this.id,
      required this.username,
      required this.name,
      required this.surname,
      required this.semesterId});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
