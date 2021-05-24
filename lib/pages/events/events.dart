import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:vu_is/localization/keys.dart';
import 'package:vu_is/pages/events/models/event.dart';
import 'package:vu_is/pages/events/models/widget/event_button.dart';
import 'package:vu_is/shared/models/user.dart';
import 'package:vu_is/shared/widgets/vu_data_loader.dart';
import 'package:vu_is/shared/widgets/vu_scaffold.dart';

class EventsPage extends StatefulWidget {
  final User user;

  EventsPage({required this.user}) : super();

  @override
  _EventsPageState createState() => _EventsPageState(this.user);
}

class _EventsPageState extends State<EventsPage> {
  final User user;

  _EventsPageState(this.user);

  @override
  Widget build(BuildContext context) {
    CollectionReference events = FirebaseFirestore.instance.collection('events');

    return new VuScaffold(
      user: this.user,
      title: Keys.Window_Events,
      body: StreamBuilder<QuerySnapshot>(
        stream: events
            .where('user', isEqualTo: FirebaseFirestore.instance.collection('users').doc(user.id))
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(translate(Keys.Errors_Unknown));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return new VuDataLoader();
          }

          double paddingSmall = MediaQuery.of(context).size.width * 0.03;
          double paddingLarge = MediaQuery.of(context).size.width * 0.05;

          return new ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  return new Event.fromJson(document.data() as Map<String, dynamic>);
                })
                .toList()
                .map((Event event) {
                  return new IntrinsicHeight(
                      child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                            right: BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          )),
                          padding: EdgeInsets.fromLTRB(paddingSmall, paddingLarge, paddingSmall, 0),
                          width: MediaQuery.of(context).size.width * 0.27,
                          child: Center(
                            child: Column(
                              children: [
                                Text(DateFormat('yyyy-MM-dd').format(event.createdAt)),
                                Text(DateFormat('kk:mm').format(event.createdAt)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFD1D1D1),
                          ),
                        )),
                        padding: EdgeInsets.fromLTRB(paddingSmall, paddingLarge, paddingSmall, 0),
                        width: MediaQuery.of(context).size.width * 0.73,
                        child: Column(
                          children: [
                            Text(event.metadata.toString()),
                            Padding(
                                padding: EdgeInsets.fromLTRB(15, 30, 15, 5),
                                child: EventButton.create(event, user, context))
                          ],
                        ),
                      )
                    ],
                  ));
                })
                .toList(),
          );
        },
      ),
    );
  }
}
