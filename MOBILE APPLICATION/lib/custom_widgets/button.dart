import 'package:SIH/utilities/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;

  const Button({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.button.copyWith(color: Colors.white),
          ),
        ),
        color: kButtonColor.withOpacity(0.7),
      ),
    );
  }
}
