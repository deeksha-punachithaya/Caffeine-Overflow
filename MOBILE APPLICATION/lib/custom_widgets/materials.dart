import 'package:flutter/material.dart';

import 'input_box..dart';

class Materials extends StatefulWidget {
  var first = InputBox(
    hintText: 'Enter Materials',
    labelText: 'Materials',
  );

  var second = InputBox(
    hintText: 'Enter Nos',
    labelText: 'Nos',
    keyboardType: TextInputType.number,
  );

  var third = InputBox(
    hintText: 'Enter Price',
    labelText: 'Price',
    keyboardType: TextInputType.number,
  );

  var fourth = InputBox(
    hintText: 'Enter Quality',
    labelText: 'Quality',
  );

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          widget.first,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Nos :      ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black),
                ),
              ),
              Expanded(child: widget.second),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Price :    ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black),
                ),
              ),
              Expanded(child: widget.third),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Quality :',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black),
                ),
              ),
              Expanded(child: widget.fourth),
            ],
          ),
        ],
      ),
    );
  }
}
