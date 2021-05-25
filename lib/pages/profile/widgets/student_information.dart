import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/profile/models/user_study.dart';
import 'package:intl/intl.dart';

class StudentInformation extends Container {
  final UserStudy userStudy;

  StudentInformation({required this.userStudy});

  @override
  EdgeInsetsGeometry? get padding => EdgeInsets.all(20);

  @override
  Widget? get child => ListView(
        children: [
          Center(
              child: Text(
            translate(Keys.Student_Title, args: {'studentNr': userStudy.studentNumber}),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 10),
          Center(child: Text(userStudy.getExtendedType())),
          Center(child: Text(userStudy.university.faculty.getName())),
          Center(child: Text(userStudy.getDescription())),
          Center(child: Text(userStudy.getProgressDescription())),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(userStudy.getFinanceInformation()),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text(translate(Keys.Studies_Start))),
              Expanded(child: Text(userStudy.start.year.toString())),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(translate(Keys.Studies_Plannedend))),
              Expanded(child: Text(DateFormat('yyyy-MM-dd').format(userStudy.plannedEnd))),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text(translate(Keys.Studies_Language))),
              Expanded(child: Text(translate(userStudy.getLanguage()))),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(translate(Keys.Student_Acceptedgrade))),
              Expanded(child: Text(userStudy.acceptedGrade.toString())),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(translate(Keys.Student_Status_Label))),
              Expanded(child: Text(userStudy.getStatus())),
            ],
          ),
        ],
      );
}
