import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:async';
import 'package:SIH/screens/attendance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Biometric extends StatefulWidget {
  static const routeName = 'Biometric';
  Biometric({
    Key key,
    @required this.document,
    @required this.field,
  }) : super(key: key);

  final DocumentSnapshot document;
  final String field;

  @override
  _BiometricState createState() => _BiometricState();
}

class _BiometricState extends State<Biometric> {
  _BiometricState();
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        //_authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated)
      Firestore.instance
          .collection('workers')
          .document(widget.document.documentID)
          .updateData({widget.field: FieldValue.delete()});
    Navigator.pushNamed(context, Attendance.routeName);
  }

  void _cancelAuthentication() {
    Navigator.pushNamed(context, Attendance.routeName);
  }

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
            'Fingerprint scanner',
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
            child: RaisedButton(
              child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
              onPressed:
                  _isAuthenticating ? _cancelAuthentication : _authenticate,
            ),
          ),
        ),
      ),
    );
  }
}
