import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/models/semester.dart';
import 'package:vu_is/widgets/semester_tile.dart';
import 'package:vu_is/widgets/vu_data_loader.dart';
import 'package:vu_is/widgets/vu_tab_controller.dart';

class StudyResultsPage extends StatefulWidget {
  StudyResultsPage() : super();

  @override
  _StudyResultsPageState createState() => _StudyResultsPageState();
}

class _StudyResultsPageState extends State<StudyResultsPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference semesters =
        FirebaseFirestore.instance.collection('semesters');

    return VuTabController(
      title: Keys.Window_Results,
      tabs: [
        Tab(
          text: translate(Keys.Tabs_Semesterresults),
        ),
        Tab(text: translate(Keys.Tabs_Studyresults)),
      ],
      bodies: [
        Scaffold(),
        Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: semesters.orderBy('identifier').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(translate(Keys.Errors_Unknown));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return new VuDataLoader();
            }

            List<Semester> semesterData =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              return new Semester.fromJson(
                  document.data() as Map<String, dynamic>);
            }).toList();

            return ListView(
              children: [
                    new Container(
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
                                  width: 60,
                                  child: new Center(
                                    child: Text(_getAverageGrade(semesterData),
                                        style: TextStyle(fontSize: 21)),
                                  )),
                              new Column(
                                children: [
                                  new Text(translate(Keys.Studies_Credits)),
                                  new Text(_getObtainedCredits(semesterData) +
                                      '/' +
                                      _getMaxCredits(semesterData))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ] +
                  semesterData.map((Semester semester) {
                    return new Container(
                        child: new Card(
                            child: SemesterTile.fromSemester(semester)));
                  }).toList(),
            );
          },
        ))
      ],
    );
  }
}

String _getAverageGrade(List<Semester> semesterData) {
  Iterable<int> grades = semesterData.map((Semester e) => e.grade);
  int gradesSum = grades.reduce((int value, int element) => value + element);
  String averageGrade = (gradesSum / semesterData.length).toStringAsFixed(2);

  return averageGrade;
}

String _getMaxCredits(List<Semester> semesterData) {
  Iterable<int> maxCredits = semesterData.map((Semester e) => e.maxCredits);

  String maxCreditsSum =
      maxCredits.reduce((int value, int element) => value + element).toString();

  return maxCreditsSum;
}

String _getObtainedCredits(List<Semester> semesterData) {
  Iterable<int> obtainedCredits =
      semesterData.map((Semester e) => e.obtainedCredits);

  String obtainedCreditsSum = obtainedCredits
      .reduce((int value, int element) => value + element)
      .toString();

  return obtainedCreditsSum;
}
