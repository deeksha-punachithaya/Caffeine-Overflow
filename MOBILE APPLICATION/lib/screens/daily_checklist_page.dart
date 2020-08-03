import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:SIH/custom_widgets/button.dart';

class DailyChecklistPage extends StatefulWidget {
  static const routeName = "DailyChecklistPage";

  @override
  _DailyChecklistPageState createState() => _DailyChecklistPageState();
}

class _DailyChecklistPageState extends State<DailyChecklistPage> {
  bool q1 = false;
  bool q2 = false;
  bool q3 = false;
  bool q4 = false;
  bool q5 = false;
  bool q6 = false;
  bool q7 = false;
  bool q8 = false;
  bool q9 = false;
  bool q10 = false;
  var docId = DateTime.now().day.toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Daily Checklist',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.format_list_bulleted),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Today\'s Date : ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Does the site have a sign posted with required hygienic practices',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(
                        Icons.bookmark,
                      ),
                      value: q1,
                      onChanged: (bool value) {
                        setState(() {
                          q1 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                        title: Text(
                          'Handwashing facilities (soap/water or hand sanitizer 60% alcohol) at every entrance?',
                          style: TextStyle(color: Colors.black),
                        ),
                        secondary: Icon(Icons.bookmark),
                        value: q2,
                        onChanged: (bool value) {
                          setState(() {
                            q2 = value;
                          });
                        }),
                    CheckboxListTile(
                      title: Text(
                        'No sharing tools or equipment?',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q3,
                      onChanged: (bool value) {
                        setState(() {
                          q3 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Schedule / Log for Cleaning surfaces/objects',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q4,
                      onChanged: (bool value) {
                        setState(() {
                          q4 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'PPE available for all?',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q5,
                      onChanged: (bool value) {
                        setState(() {
                          q5 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Manage interactions during deliveries / Maintain social distancin',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q6,
                      onChanged: (bool value) {
                        setState(() {
                          q6 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Site to have daily attendance log (workers/visitors)',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q7,
                      onChanged: (bool value) {
                        setState(() {
                          q7 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Control “Choke Points” and “High Risk Areas” to ensure social distancing?',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q8,
                      onChanged: (bool value) {
                        setState(() {
                          q8 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Stagger trades to minimize worker density',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q9,
                      onChanged: (bool value) {
                        setState(() {
                          q9 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(
                        'COVID-19 Supervisor (sites w/ more than 4 workers)',
                        style: TextStyle(color: Colors.black),
                      ),
                      secondary: Icon(Icons.bookmark),
                      value: q10,
                      onChanged: (bool value) {
                        setState(() {
                          q10 = value;
                        });
                      },
                    ),
                    Button(
                        onPressed: () {
                          print('${[q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]}');
                          print(docId);
                          Firestore.instance
                              .collection('daily_checklist')
                              .document(docId)
                              .setData({
                            "q1": q1,
                            "q2": q2,
                            "q3": q3,
                            "q4": q4,
                            "q5": q5,
                            "q6": q6,
                            "q7": q7,
                            "q8": q8,
                            "q9": q9,
                            "q10": q10,
                          });
                        },
                        text: 'submit')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
