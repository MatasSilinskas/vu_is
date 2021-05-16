import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/event.dart';

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
    LocalizationDelegate localizationDelegate = LocalizedApp.of(context).delegate;

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
                return Text('Error occured: ' + snapshot.error.toString());
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
          'Ivykiai',
          style: TextStyle(color: Color(0xFF000000)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: events.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF690335)),
                ),
                Container(width: 20, height: 20),
                new Text("Kraunasi..."),
              ]),
            );
          }

          return new ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  return new Event.fromJson(
                      document.data() as Map<String, dynamic>);
                })
                .toList()
                .map((Event event) {
                  return new Row(
                    children: [
                      Text(event.type),
                      Text(event.createdAt.toString()),
                      Text(event.metadata.toString()),
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Color(0xFF690335);
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Color(0xFFFFFFFF);
                    },
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.arrow_upward),
                label: Text("Meniu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
