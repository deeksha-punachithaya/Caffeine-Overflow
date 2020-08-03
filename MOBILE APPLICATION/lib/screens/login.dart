import 'package:flutter/material.dart';
import 'package:SIH/custom_widgets/input_box..dart';
import 'package:SIH/custom_widgets/button.dart';
import 'package:SIH/screens/home_page.dart';

import '../custom_widgets/button.dart';

class Login extends StatefulWidget {
  static const routeName = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              text,
              style: TextStyle(color: Colors.black),
            )),
      );
  var username = InputBox(
    hintText: 'Enter username',
    labelText: 'Username',
    keyboardType: TextInputType.emailAddress,
  );
  var password = InputBox(
    hintText: 'Enter Password',
    labelText: 'Password',
    keyboardType: TextInputType.text,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.people),
                username,
                password,
                Button(
                    onPressed: () {
                      if (username.input == 'contractor@gmail.com' &&
                          password.input == 'abc123') {
                        Navigator.pushNamed(context, HomePage.routeName);
                      } else {
                        displayDialog(
                            context, 'An Error Occured', 'please try again');
                      }
                    },
                    text: 'Login')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
