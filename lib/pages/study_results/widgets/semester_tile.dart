import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';

class SemesterTile extends ListTile {
  SemesterTile.fromSemester(Semester semester, BuildContext context)
      : super(
          leading: new SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: new Center(
                child: Text(
              semester.grade.toString(),
              style: TextStyle(fontSize: 21, color: Colors.black),
            )),
          ),
          trailing: new Container(
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
          ),
          title: new Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: new Text(translate(Keys.Studies_Semestername,
                  args: {'identifier': semester.identifier}))),
        );
}
