import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vu_is/pages/study_results/models/university.dart';

part 'study.g.dart';

@JsonSerializable()
class Study {
  final String type;
  final University university;

  Study({required this.type, required this.university});

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);

  @override
  String toString() => translate('studies.type.' + this.type);
}
