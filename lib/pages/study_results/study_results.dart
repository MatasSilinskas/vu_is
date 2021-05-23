import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/study_results/models/semester.dart';
import 'package:vu_is/pages/study_results/models/subject_grade.dart';
import 'package:vu_is/pages/study_results/widgets/average_grade.dart';
import 'package:vu_is/pages/study_results/widgets/semester_tile.dart';
import 'package:vu_is/pages/study_results/widgets/subject_tile.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
import 'package:vu_is/shared/widgets/vu_tab_controller.dart';

class StudyResultsPage extends StatefulWidget {
  static const tabAllResults = 0;
  static const tabSemesterResults = 1;

  final String? selectedSemesterId;
  final User user;
  final int selectedPageNumber;

  StudyResultsPage(
      {this.selectedSemesterId, required this.user, this.selectedPageNumber = StudyResultsPage.tabAllResults})
      : super();

  @override
  _StudyResultsPageState createState() => _StudyResultsPageState(
      selectedSemesterId: this.selectedSemesterId == null ? this.user.semesterId : this.selectedSemesterId!,
      user: this.user,
      selectedPageNumber: this.selectedPageNumber);
}

class _StudyResultsPageState extends State<StudyResultsPage> {
  String selectedSemesterId;
  final User user;
  final int selectedPageNumber;

  _StudyResultsPageState({required this.selectedSemesterId, required this.user, required this.selectedPageNumber});

  @override
  Widget build(BuildContext context) {
    CollectionReference semesters = FirebaseFirestore.instance.collection('semesters');

    CollectionReference subjectGrades = FirebaseFirestore.instance.collection('subjectGrades');

    return VuTabController(
      selectedTabNumber: this.selectedPageNumber,
      user: this.user,
      title: Keys.Window_Results,
      tabs: [
        Tab(text: translate(Keys.Tabs_Studyresults)),
        Tab(
          text: translate(Keys.Tabs_Semesterresults),
        ),
      ],
      bodies: [
        Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: semesters
              .where('user', isEqualTo: FirebaseFirestore.instance.collection('users').doc(user.id))
              .orderBy('identifier')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(translate(Keys.Errors_Unknown));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return new VuDataLoader();
            }

            return _buildSemesterView(context, snapshot);
          },
        )),
        Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: subjectGrades
              .where('semester',
                  isEqualTo: FirebaseFirestore.instance.collection('semesters').doc(this.selectedSemesterId))
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(translate(Keys.Errors_Unknown));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return new VuDataLoader();
            }

            List<SubjectGrade> subjectGradeData = snapshot.data!.docs.map((DocumentSnapshot document) {
              return new SubjectGrade.fromJson(document.data() as Map<String, dynamic>);
            }).toList();

            Container averageGrade = new AverageGrade(gradesList: subjectGradeData);

            Container semesterDropdown = new Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                new Text(translate(Keys.Studies_Semesters)),
                new StreamBuilder(
                    stream: semesters
                        .where('user', isEqualTo: FirebaseFirestore.instance.collection('users').doc(user.id))
                        .orderBy('identifier')
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text(translate(Keys.Errors_Unknown));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return new VuDataLoader();
                      }

                      return _buildSemesterDropdown(snapshot);
                    }),
              ]),
            );

            return ListView(
              children: [averageGrade, semesterDropdown] +
                  subjectGradeData.map((SubjectGrade subjectGrade) {
                    return new Container(
                        child: new Card(
                      child: SubjectTile.fromSubjectGrade(subjectGrade, context),
                    ));
                  }).toList(),
            );
          },
        )),
      ],
    );
  }

  DropdownButtonHideUnderline _buildSemesterDropdown(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Semester> semesterData = _getSemesterDataFromSnapshot(snapshot);

    return new DropdownButtonHideUnderline(
        child: new Container(
      height: 39,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedSemesterId,
        icon: new Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: (String? newValue) {
          setState(() {
            selectedSemesterId = newValue!;
          });
        },
        items: semesterData.map((Semester semester) {
          return DropdownMenuItem<String>(
            value: semester.id,
            child: Padding(padding: EdgeInsets.only(left: 10), child: Text(semester.toString())),
          );
        }).toList(),
      ),
    ));
  }

  ListView _buildSemesterView(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Semester> semesterData = _getSemesterDataFromSnapshot(snapshot);
    Container averageGrade = new AverageGrade(gradesList: semesterData);

    return ListView(
      children: [averageGrade] +
          semesterData.map((Semester semester) {
            return new Container(child: new Card(child: SemesterTile.create(semester, user, context)));
          }).toList(),
    );
  }

  List<Semester> _getSemesterDataFromSnapshot(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      var documentData = document.data() as Map<String, dynamic>;
      documentData.addAll({'id': document.id});

      return new Semester.fromJson(documentData);
    }).toList();
  }
}
