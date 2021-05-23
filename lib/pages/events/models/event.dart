import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/events/models/metadata.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  static const typeGradeAdded = 'grade_added';
  static const typeRegistrationsIncoming = 'registrations_incoming';
  static const typeRegistrationsStarted = 'registrations_started';

  final String type;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime createdAt;

  @JsonKey(toJson: _metadataToMap)
  late final Metadata metadata;

  Event(
      {required this.type,
      required this.createdAt,
      Map<String, dynamic>? metadata}) {
    this.metadata = Metadata.create(this.type, metadata == null ? {} : metadata);
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) =>
      timestamp.toDate();

  static Timestamp _dateTimeToTimestamp(DateTime dateTime) =>
      Timestamp.fromDate(dateTime);

  static Map<String, dynamic> _metadataToMap(Metadata metadata) =>
      metadata.toJson();
}
