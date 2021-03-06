import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/grade.dart';

class AverageGrade extends Container {
  AverageGrade({required List<Grade> gradesList})
      : super(
          padding: EdgeInsets.only(bottom: 20),
          child: new Column(
            children: [
              new Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    translate(Keys.Studies_Averagegrade),
                  )),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new SizedBox(
                      width: 65,
                      child: new Center(
                        child: Text(_getAverageGrade(gradesList),
                            style: TextStyle(fontSize: 21)),
                      )),
                  new Column(
                    children: [
                      new Text(translate(Keys.Studies_Credits)),
                      new Text(_getObtainedCredits(gradesList) +
                          '/' +
                          _getMaxCredits(gradesList))
                    ],
                  )
                ],
              )
            ],
          ),
        );
}

String _getAverageGrade(List<Grade> gradesData) {
  Iterable<int> grades = gradesData.map((Grade e) => e.grade * e.obtainedCredits);
  int gradesSum = grades.reduce((int value, int element) => value + element);
  int maxCredits = int.parse(_getMaxCredits(gradesData));
  String averageGrade = (gradesSum / maxCredits).toStringAsFixed(2);

  while (averageGrade.endsWith('0')) {
    averageGrade = averageGrade.substring(0, averageGrade.length - 1);
  }

  if (averageGrade.endsWith('.')) {
    averageGrade = averageGrade.substring(0, averageGrade.length - 1);
  }

  return averageGrade;
}

String _getMaxCredits(List<Grade> gradesData) {
  Iterable<int> maxCredits = gradesData.map((Grade e) => e.maxCredits);

  String maxCreditsSum =
      maxCredits.reduce((int value, int element) => value + element).toString();

  return maxCreditsSum;
}

String _getObtainedCredits(List<Grade> gradesData) {
  Iterable<int> obtainedCredits =
      gradesData.map((Grade e) => e.obtainedCredits);

  String obtainedCreditsSum = obtainedCredits
      .reduce((int value, int element) => value + element)
      .toString();

  return obtainedCreditsSum;
}
