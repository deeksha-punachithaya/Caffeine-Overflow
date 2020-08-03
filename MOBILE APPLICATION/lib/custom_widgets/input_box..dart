import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  var input;
  final keyboardType;
  final maxLength;
  final maxLines;
  final obscureText;
  final hintText;
  final labelText;

  InputBox({
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.obscureText,
    @required this.hintText,
    @required this.labelText,
  });

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (val) {
          widget.input = val;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
          ),
          alignLabelWithHint: true,
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.grey),
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black),
        ),
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText ?? false,
        style:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
      ),
    );
  }
}
