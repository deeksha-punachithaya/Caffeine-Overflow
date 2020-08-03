import 'package:flutter/material.dart';

import 'input_box..dart';

class ItemOfWork extends StatefulWidget {
  var first = InputBox(
    hintText: 'Enter Work',
    labelText: 'Work',
  );

  var second = InputBox(
    hintText: 'Enter Percentage',
    labelText: 'Percentage Complete %',
    keyboardType: TextInputType.number,
  );
  @override
  _ItemOfWorkState createState() => _ItemOfWorkState();
}

class _ItemOfWorkState extends State<ItemOfWork> {
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
                  'Completion% :',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black),
                ),
              ),
              Expanded(child: widget.second),
            ],
          ),
        ],
      ),
    );
  }
}
