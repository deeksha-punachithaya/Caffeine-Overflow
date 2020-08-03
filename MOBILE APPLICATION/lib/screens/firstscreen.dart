import 'package:SIH/screens/public_feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:SIH/custom_widgets/menu_item.dart';
import 'package:SIH/utilities/constants.dart';
import 'home_page.dart';
import 'package:SIH/screens/login.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GharSuraksha',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: MenuItem(
                    color: kMenuColor1,
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                    icon: Icons.local_convenience_store,
                    text: 'Contrator Login',
                  ),
                ),
                Expanded(
                  child: MenuItem(
                    color: kMenuColor6,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PublicFeedbackPage.routeName,
                      );
                    },
                    icon: Icons.public,
                    text: 'Anonymous Public Portal',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
