import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';

class SemesterTile extends ListTile {
  SemesterTile.fromSemester(Semester semester)
      : super(
            title: new Row(
          children: [
            new SizedBox(
              width: 50,
              child: new Center(
                  child: Text(
                semester.grade.toString(),
              )),
            ),
            new Padding(
                padding: EdgeInsets.only(left: 20),
                child: new Text(translate(Keys.Studies_Semestername,
                    args: {'identifier': semester.identifier}))),
            new Spacer(),
            new Container(
              child: new Padding(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(2),
              ),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF690335),
              ),
            )
          ],
        ));
}
