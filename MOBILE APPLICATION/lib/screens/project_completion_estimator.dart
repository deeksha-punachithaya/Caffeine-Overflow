import 'dart:io';

import 'package:SIH/custom_widgets/button.dart';
import 'package:SIH/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProjectCompletionEstimator extends StatefulWidget {
  static const routeName = "ProjectCompletionEstimator";

  @override
  _ProjectCompletionEstimatorState createState() =>
      _ProjectCompletionEstimatorState();
}

class _ProjectCompletionEstimatorState
    extends State<ProjectCompletionEstimator> {
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
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
            'Project Completion Estimator',
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
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDEDEDE),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: _image != null
                          ? Image.file(_image)
                          : Center(
                              child: Text(
                                'Capture Image...',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: getImageFromCamera,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.camera,
                                  size: 32.0,
                                ),
                                SizedBox(height: 8.0),
                                Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: getImageFromGallery,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.image,
                                  size: 32.0,
                                ),
                                SizedBox(height: 8.0),
                                Text('Gallery'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Button(
                    onPressed: () {
                      print('hmm');
                    },
                    text: 'CALCULATE',
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
