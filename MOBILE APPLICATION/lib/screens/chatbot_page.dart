import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:SIH/custom_widgets/chatbot_feature_button.dart';
import 'package:SIH/custom_widgets/input_box..dart';
import 'package:SIH/custom_widgets/button.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatefulWidget {
  static const routeName = "ChatpagePage";

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  var f1 = InputBox(
    hintText: 'Enter Area Number',
    labelText: 'Area Number',
    keyboardType: TextInputType.number,
  );

var f2 = InputBox(
    hintText: 'Enter Your Query',
    labelText: 'Ask Me Anything',
    keyboardType: TextInputType.text,
  );

  List<bool> vis = [false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE3DCD2),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'GharSuraksha',
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
        body: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Message(text: 'Hey, I\'m Suraksha!'),
                    Message(
                      text:
                          '''Here\'s what I can do!\n\n1) Sitewise Details\n2) Query PMAY\n3) Take me to website''',
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChatbotFeatureButton(
                            text: ' 1  ',
                            onTap: () {
                              setState(() {
                                vis[0] = !vis[0];
                              });
                            },
                          ),
                          ChatbotFeatureButton(
                            text: ' 2 ',
                            onTap: () {
                              vis[1] = !vis[1];
                            },
                          ),
                          ChatbotFeatureButton(
                            text: ' 3 ',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: vis[0],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xFFDCF7C3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 2.0,
                                spreadRadius: 0.2)
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            f1,
                            Button(
                              text: 'GO',
                              onPressed: () async {
                                var response = await http.get(
                                    'http://694e84e41ce2.ngrok.io/area/${f1.input}');
                                var body = response.body;
                                var data = json.decode(body);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Area Details',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      content: ListView(
                                        children: <Widget>[
                                          Text(
                                            'Contract Laboureres(weekly): ${data['Contract labourers this week']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Contractor: ${data['Contractor']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Basement: ${data['Items of Work']['basement']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Foundation: ${data['Items of Work']['foundation']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Parking: ${data['Items of Work']['parking']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Min Days a week: ${data['Minimum Days a week']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'No. of Plots: ${data['Number of Plots']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Contract complete: ${data['Percent of contract complete']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        IconButton(
                                          color: Colors.blueAccent,
                                          icon: Icon(Icons.check,
                                              size: 42.0, color: Colors.green),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: vis[1],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xFFDCF7C3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 2.0,
                                spreadRadius: 0.2)
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            f2,
                            Button(
                              text: 'GO',
                              onPressed: () async {
                                var response = await http.get(
                                    'http://694e84e41ce2.ngrok.io/${f2.input}');
                                var body = response.body;
                                var data = json.decode(body);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Area Details',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      content: ListView(
                                        children: <Widget>[
                                          Text(
                                            'Contract Laboureres(weekly): ${data['Contract labourers this week']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Contractor: ${data['Contractor']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Basement: ${data['Items of Work']['basement']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Foundation: ${data['Items of Work']['foundation']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Parking: ${data['Items of Work']['parking']['Percent Complete Total']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Min Days a week: ${data['Minimum Days a week']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'No. of Plots: ${data['Number of Plots']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Text(
                                            'Contract complete: ${data['Percent of contract complete']}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        IconButton(
                                          color: Colors.blueAccent,
                                          icon: Icon(Icons.check,
                                              size: 42.0, color: Colors.green),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  const Message({
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 2.0,
                  spreadRadius: 0.2)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
