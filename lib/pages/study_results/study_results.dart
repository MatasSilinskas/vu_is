import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';
import 'package:vu_is/pages/study_results/models/subject_grade.dart';
import 'package:vu_is/pages/study_results/widgets/average_grade.dart';
import 'package:vu_is/pages/study_results/widgets/semester_tile.dart';
import 'package:vu_is/pages/study_results/widgets/subject_tile.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';

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

    CollectionReference subjectGrades =
        FirebaseFirestore.instance.collection('subjectGrades');

    return VuTabController(
      title: Keys.Window_Results,
      tabs: [
        Tab(
          text: translate(Keys.Tabs_Semesterresults),
        ),
        Tab(text: translate(Keys.Tabs_Studyresults)),
      ],
      bodies: [
        Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: subjectGrades.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(translate(Keys.Errors_Unknown));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return new VuDataLoader();
            }

            List<SubjectGrade> subjectGradeData =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              return new SubjectGrade.fromJson(
                  document.data() as Map<String, dynamic>);
            }).toList();

            Container averageGrade = new AverageGrade(gradesList: subjectGradeData);

            return ListView(
              children: [averageGrade] +
                  subjectGradeData.map((SubjectGrade subjectGrade) {
                    return new Container(
                        child: new Card(child: SubjectTile.fromSubjectGrade(subjectGrade),));
                  }).toList(),
            );
          },
        )),
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

            Container averageGrade = new AverageGrade(gradesList: semesterData);

            return ListView(
              children: [averageGrade] +
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
