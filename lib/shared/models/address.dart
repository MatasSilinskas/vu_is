import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String country;
  final String city;
  final int houseNumber;
  final int postalCode;
  final String street;
  int? flatNumber;

  Address({
    required this.country,
    required this.city,
    required this.houseNumber,
    required this.postalCode,
    required this.street,
    this.flatNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String getShortDescription() => this.city + ', ' + this.street + ' ' + this.houseNumber.toString();
}
