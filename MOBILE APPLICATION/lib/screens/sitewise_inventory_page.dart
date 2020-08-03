import 'package:SIH/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SitewiseInventoryPage extends StatefulWidget {
  static const routeName = "SitewiseInventoryPage";

  @override
  _SitewiseInventoryPageState createState() => _SitewiseInventoryPageState();
}

class _SitewiseInventoryPageState extends State<SitewiseInventoryPage> {
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
            'Sitewise Inventory',
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
              stream: Firestore.instance.collection("inventory").snapshots(),
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
                    return ListTile(
                      title: ProjectBox(document: document),
                      subtitle: Text(
                        'Project Site ${index + 1} of $messageCount',
                        style: TextStyle(color: Colors.black),
                      ),
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
        color: kMenuColor4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              document.documentID != null
                  ? document.documentID.toString()
                  : '<No message retrieved>',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            FutureBuilder(
              future: getChildren(document: document),
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
    return List.generate(
      document.data.length,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              document.data.keys.toList()[index].toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Text(
              document.data.values.toList()[index].toString(),
            ),
          ),
        ],
      ),
    )
      ..insert(0, Text('ITEM  :  QTY'))
      ..insert(1, SizedBox(height: 18.0));
  }
}
