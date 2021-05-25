// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    type: json['type'] as String,
    createdAt: Event._dateTimeFromTimestamp(json['createdAt'] as Timestamp),
    metadata: json['metadata'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'type': instance.type,
      'createdAt': Event._dateTimeToTimestamp(instance.createdAt),
      'metadata': instance.metadata,
    };
