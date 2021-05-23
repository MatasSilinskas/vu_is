import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/pages/study_results/models/subject_grade.dart';
import 'package:vu_is/localization/keys.dart';

class SubjectTile extends ExpansionTile {
  SubjectTile.fromSubjectGrade(SubjectGrade subjectGrade, BuildContext context)
      : super(
          leading: new SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: new Center(
                child: Text(
              subjectGrade.grade.toString(),
              style: TextStyle(fontSize: 21, color: Colors.black),
            )),
          ),
          trailing: new Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF690335),
            size: 38,
          ),
          children: [
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.225,
                  child: new Center(
                      child: new Text(translate(Keys.Studies_Credits))),
                ),
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.745,
                  child: new Text(subjectGrade.subject.professor.getFullName()),
                ),
              ],
            ),
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.225,
                  child: new Center(child: new Text(subjectGrade.getCredits())),
                ),
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.745,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new SizedBox(height: 5),
                      new Text(subjectGrade.subject.professor.email),
                      new SizedBox(height: 5),
                      new Text(subjectGrade.toString()),
                    ],
                  ),
                ),
              ],
            )
          ],
          title: new Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: new Text(
                subjectGrade.subject.toString(),
                style: TextStyle(color: Colors.black),
              )),
        );
}
