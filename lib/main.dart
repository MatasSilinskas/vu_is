import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/models/widgets/vertical_divider.dart';

import 'models/event.dart';
import 'models/style/button_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocalizationDelegate delegate = await LocalizationDelegate.create(
      fallbackLocale: 'lt', supportedLocales: ['lt']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    LocalizationDelegate localizationDelegate =
        LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate,
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          home: FutureBuilder(
            future: _firebaseApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return MyHomePage();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(Keys.Window_Events),
          style: TextStyle(color: Color(0xFF000000)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: events.orderBy('createdAt', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(translate(Keys.Errors_Unknown));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF690335)),
                ),
                Container(width: 20, height: 20),
                new Text(translate(Keys.Custom_Loading)),
              ]),
            );
          }

          double paddingSmall = MediaQuery.of(context).size.width * 0.03;
          double paddingLarge = MediaQuery.of(context).size.width * 0.05;

          return new ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  return new Event.fromJson(
                      document.data() as Map<String, dynamic>);
                })
                .toList()
                .map((Event event) {
                  return new Column(
                    children: [
                      IntrinsicHeight(
                          child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(
                                  paddingSmall, paddingLarge, paddingSmall, 0),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(DateFormat('yyyy-MM-dd')
                                        .format(event.createdAt)),
                                    Text(DateFormat('kk:mm')
                                        .format(event.createdAt)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )),
                          VilniusUniversityVerticalDivider(),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                paddingSmall, paddingLarge, paddingSmall, 0),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              children: [
                                Text(event.metadata.toString()),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 30, 15, 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(translate(
                                        'button.event.action.' + event.type)),
                                    style: VilniusUniversityButtonStyle(),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                      Container(
                        child: Divider(
                          color: Color(0xFFD1D1D1),
                        ),
                      )
                    ],
                  );
                })
                .toList(),
          );
        },
      ),
      bottomNavigationBar: new BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: TextButton.icon(
                style: VilniusUniversityButtonStyle(),
                onPressed: () {},
                icon: Icon(Icons.arrow_upward),
                label: Text(translate(Keys.Button_Navigation_Menu)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
