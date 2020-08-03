import 'package:SIH/screens/chatbot_page.dart';
import 'package:SIH/custom_widgets/button.dart';
import 'package:SIH/custom_widgets/input_box..dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PublicFeedbackPage extends StatefulWidget {
  static const routeName = "PublicFeedbackPage";

  @override
  _PublicFeedbackPageState createState() => _PublicFeedbackPageState();
}

class _PublicFeedbackPageState extends State<PublicFeedbackPage> {
  var feedback = InputBox(
    hintText: 'Enter your feedback here',
    labelText: 'Feedback',
    maxLines: 15,
  );

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
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Suraksha Chatbot',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChatbotPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.orangeAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'USE SURAKSHA',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Give your feedback below',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              feedback,
              Button(
                onPressed: () async {
                  Firestore.instance.collection('public_feedback').add({
                    'feedback_date': DateTime.now(),
                    'feedback': feedback.input,
                  });
                },
                text: 'SUBMIT',
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Pradhan Mantri Awas Yojana (Urban) Mission launched on 25th June 2015 which intends to provide housing for all in urban areas by year 2022. The Mission provides Central Assistance to the implementing agencies through States/Union Territories (UTs) and Central Nodal Agencies (CNAs) for providing houses to all eligible families/ beneficiaries against the validated demand for houses for about 1.12 cr. As per PMAY(U) guidelines, the size of a house for Economically Weaker Section (EWS) could be upto 30 sq. mt. carpet area, however States/UTs have the flexibility to enhance the size of houses in consultation and approval of the Ministry. In continuation to this Government’s efforts towards empowerment of women from EWS and LIG unlike earlier schemes, PMAY (U) has made a mandatory provision for the female head of the family to be the owner or co-owner of the house under this Mission. Verticals of PMAY (Urban) A basket of options is adopted to ensure inclusion of a greater number of people depending on their income, finance and availability of land through following four options.',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
