import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:SIH/utilities/constants.dart';
import 'package:SIH/screens/biometric.dart';

class Attendance extends StatefulWidget {
  static const routeName = 'attendance';
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('Attendance List'),
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
            stream: Firestore.instance.collection("workers").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return CircularProgressIndicator(
                  semanticsValue: 'Loading...',
                  semanticsLabel: 'Awaiting Data',
                );
              final int count = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: count,
                itemBuilder: (_, int index) {
                  final DocumentSnapshot document =
                      snapshot.data.documents[index];
                  return ListTile(
                    title: AttendanceBox(document: document),
                    subtitle: Text(
                      'Project Site ${index + 1} of $count',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    ));
  }
}

class AttendanceBox extends StatefulWidget {
  AttendanceBox({
    Key key,
    @required this.document,
  }) : super(key: key);

  final DocumentSnapshot document;

  @override
  _AttendanceBoxState createState() => _AttendanceBoxState();
}

class _AttendanceBoxState extends State<AttendanceBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              widget.document.documentID != null
                  ? widget.document.documentID.toString()
                  : '<No message retrieved>',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            FutureBuilder(
              future: getChildren(document: widget.document),
              initialData: <Widget>[
                Center(
                  child: Text('Awaiting Data..'),
                ),
              ],
              builder: (context, snapshot) {
                switch (snapshot.hasData) {
                  case true:
                    return Column(
                      children: snapshot.data,
                    );
                  case false:
                    return CircularProgressIndicator();
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Future<List<Widget>> getChildren({var document}) async {
    Icon attended = Icon(Icons.add_circle);
    return List.generate(
      document.data.length,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              document.data.keys.toList()[index].toString(),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                child: IconButton(
              icon: attended,
              onPressed: () {
                print('hello');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Biometric(
                          document: widget.document,
                          field: document.data.keys.toList()[index].toString(),
                        )));
                // Navigator.pushNamed(context, Biometric.routeName);
                // setState(() {
                //   attended = Icon(Icons.check);
                // });
                // Firestore.instance
                //     .collection('workers')
                //     .document(widget.document.documentID)
                //     .updateData({'fawaz': 'present'});
              },
            )),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    )
      ..insert(0, Text('PERSON  :  STATUS'))
      ..insert(1, SizedBox(height: 18.0));
  }
}
