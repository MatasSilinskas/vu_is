import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/registrations/models/semester.dart';
import 'package:vu_is/pages/registrations/models/subject.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  final int acceptedSlots;
  final int maxAllowed;
  String? group;
  final String type;
  final Semester semester;
  final Subject subject;

  Registration({
    required this.acceptedSlots,
    required this.maxAllowed,
    required this.type,
    required this.semester,
    required this.subject,
    this.group,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => _$RegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
