import 'package:flutter/material.dart';

class ChatbotFeatureButton extends StatelessWidget {
  final String text;
  final Function onTap;

  ChatbotFeatureButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xFF0B5E54),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 2.0,
                spreadRadius: 0.2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
