import 'event.dart';
import 'metadata/grade_added_metadata.dart';
import 'metadata/registrations_incoming.dart';
import 'metadata/registrations_started.dart';

class Metadata {
  Metadata();

  factory Metadata.create(String type, Map<String, dynamic> json) {
    switch (type) {
      case Event.typeGradeAdded:
        return GradeAddedMetadata.fromJson(json);
      case Event.typeRegistrationsIncoming:
        return RegistrationsIncoming();
      case Event.typeRegistrationsStarted:
        return RegistrationsStarted();
    }

    return Metadata();
  }

  Map<String, dynamic> toJson() => {};
}
