import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/registrations/models/selected_subject.dart';

part 'upcoming_registration.g.dart';

@JsonSerializable()
class UpcomingRegistration {
  String id;
  String? group;
  final String type;
  final List<SelectedSubject> subjects;

  UpcomingRegistration({
    required this.id,
    required this.type,
    this.group,
    required this.subjects,
  });

  factory UpcomingRegistration.fromJson(Map<String, dynamic> json) => _$UpcomingRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingRegistrationToJson(this);

  static List<UpcomingRegistration> fromSnapshot(AsyncSnapshot<QuerySnapshot> snapshot) =>
      snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        data.addAll({'id': document.id});
        return new UpcomingRegistration.fromJson(data);
      }).toList();
}
