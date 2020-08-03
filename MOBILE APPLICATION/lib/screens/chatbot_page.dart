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

  List<bool> vis = [false];

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
                          '''Here\'s what I can do!\n1) A\n2) B\n3) C\n4) D\n5) E''',
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
                            onTap: () {},
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
                                var response = await http
                                    .get('http://694e84e41ce2.ngrok.io/area/');
                                var body = response.body;
                                var data = json.decode(body);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Area Details'),
                                      content: ListView(
                                        children: <Widget>[
                                          Text(''),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.check),
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
