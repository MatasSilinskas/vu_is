import 'package:flutter/material.dart';
import 'package:vu_is/pages/study_results/models/subject_grade.dart';

class SubjectTile extends ListTile {
  SubjectTile.fromSubjectGrade(SubjectGrade subjectGrade)
      : super(
            title: new Row(
          children: [
            new SizedBox(
              width: 50,
              child: new Center(
                  child: Text(
                subjectGrade.grade.toString(),
                style: TextStyle(fontSize: 21),
              )),
            ),
            new Padding(
                padding: EdgeInsets.only(left: 20),
                child: new Text(subjectGrade.subject.toString())),
            new Spacer(),
            new Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF690335),
              size: 38,
            ),
          ],
        ));
}
