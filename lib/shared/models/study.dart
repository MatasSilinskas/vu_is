import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/university.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study.g.dart';

@JsonSerializable()
class Study {
  final int course;
  final int group;
  final int semester;
  final int acceptedGrade;
  final String direction;
  final String form;
  final String stage;
  final String type;
  final String finance;
  final String language;
  final University university;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime start;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime plannedEnd;

  Study({
    required this.course,
    required this.group,
    required this.semester,
    required this.direction,
    required this.form,
    required this.stage,
    required this.start,
    required this.plannedEnd,
    required this.university,
    required this.type,
    required this.finance,
    required this.language,
    required this.acceptedGrade,
  });

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp.toDate();

  static Timestamp _dateTimeToTimestamp(DateTime dateTime) => Timestamp.fromDate(dateTime);

  String getExtendedType() => translate('studies.extended_type.' + this.direction);

  String getDescription() => translate(Keys.Studies_Description, args: {
        'form': translate('studies.form.' + this.form),
        'stage': translate('studies.stage.' + this.stage),
        'type': translate('studies.type.' + this.type),
      });

  String getProgressDescription() => translate(Keys.Student_Progressdescription, args: {
        'course': this.course,
        'semester': this.semester,
        'group': this.group,
      });

  String getFinanceInformation() => translate('studies.finance.' + this.finance);
  String getLanguage() => translate('languages.' + this.language);
}
