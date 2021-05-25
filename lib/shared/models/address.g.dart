// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    country: json['country'] as String,
    city: json['city'] as String,
    houseNumber: json['houseNumber'] as int,
    postalCode: json['postalCode'] as int,
    street: json['street'] as String,
    flatNumber: json['flatNumber'] as int?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'houseNumber': instance.houseNumber,
      'postalCode': instance.postalCode,
      'street': instance.street,
      'flatNumber': instance.flatNumber,
    };
