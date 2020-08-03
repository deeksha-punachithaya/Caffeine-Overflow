import 'dart:ui';

import 'package:SIH/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const routeName = "ProjectCompletionEstimatorPage";

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
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
            'Project Details',
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
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("projects").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return CircularProgressIndicator(
                    semanticsValue: 'Loading...',
                    semanticsLabel: 'Awaiting Data',
                  );
                final int messageCount = snapshot.data.documents.length;
                return ListView.builder(
                  itemCount: messageCount,
                  itemBuilder: (_, int index) {
                    final DocumentSnapshot document =
                        snapshot.data.documents[index];
                    print(document.data);
                    return ListTile(
                      title: ProjectBox(document: document),
                      subtitle:
                          Text('Project Site ${index + 1} of $messageCount'),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectBox extends StatelessWidget {
  const ProjectBox({
    Key key,
    @required this.document,
  }) : super(key: key);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMenuColor2,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              document.data['address'] != null
                  ? document.data['address'].toString()
                  : '<No message retrieved>',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  'Manager: ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  document.data['manager'] != null
                      ? document.data['manager'].toString()
                      : '<No message retrieved>',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  'Planned Completion Date: ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  document.data['estimated_completion_date'] != null
                      ? document.data['estimated_completion_date']
                              .toDate()
                              .day
                              .toString() +
                          '/' +
                          document.data['estimated_completion_date']
                              .toDate()
                              .month
                              .toString() +
                          '/' +
                          document.data['estimated_completion_date']
                              .toDate()
                              .year
                              .toString()
                      : '<No message retrieved>',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  'Budget Allocated: ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  document.data['total_budget_allocated'] != null
                      ? 'Rs. ' +
                          document.data['total_budget_allocated'].toString()
                      : '<No message retrieved>',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
