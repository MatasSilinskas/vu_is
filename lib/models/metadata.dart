import 'package:vu_is/models/metadata/grade_added_metadata.dart';

import 'event.dart';

class Metadata {
  Metadata();

  factory Metadata.create(String type, Map<String, dynamic> json) {
    switch (type) {
      case Event.typeGradeAdded:
        return GradeAddedMetadata.fromJson(json);
    }

    return Metadata();
  }

  Map<String, dynamic> toJson() => {};
}
