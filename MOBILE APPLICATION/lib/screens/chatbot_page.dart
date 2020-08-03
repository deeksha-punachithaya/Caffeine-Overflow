import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  static const routeName = "ChatpagePage";

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
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
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFC7F88C),
                  ),
                  child: Text(
                    'Hey I\'m Suraksha!',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFC7F88C),
                  ),
                  child: Text(
                    '''Here\'s what I can do!
                      1) A
                      2) B
                      3) C
                      4) D
                    ''',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
