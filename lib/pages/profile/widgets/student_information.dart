import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:intl/intl.dart';

class StudentInformation extends Scaffold {
  final User user;

  StudentInformation({required this.user});

  @override
  Widget? get body => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              translate(Keys.Student_Title, args: {'studentNr': user.studentNumber}),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(user.study.getExtendedType()),
            Text(user.study.university.faculty.getName()),
            Text(user.study.getDescription()),
            Text(user.study.getProgressDescription()),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(user.study.getFinanceInformation()),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text(translate(Keys.Studies_Start))),
                Expanded(child: Text(user.study.start.year.toString())),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(translate(Keys.Studies_Plannedend))),
                Expanded(child: Text(DateFormat('yyyy-MM-dd').format(user.study.plannedEnd))),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text(translate(Keys.Studies_Language))),
                Expanded(child: Text(translate(user.study.getLanguage()))),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(translate(Keys.Student_Acceptedgrade))),
                Expanded(child: Text(user.study.acceptedGrade.toString())),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(translate(Keys.Student_Status_Label))),
                Expanded(child: Text(user.getStatus())),
              ],
            ),
          ],
        ),
      );
}
