import 'package:SIH/custom_widgets/menu_item.dart';
import 'package:SIH/screens/daily_checklist_page.dart';
import 'package:SIH/screens/project_completion_estimator.dart';
import 'package:SIH/screens/project_details_page.dart';
import 'package:SIH/screens/public_feedback_page.dart';
import 'package:SIH/screens/weekly_feedback.dart';
import 'package:SIH/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:SIH/screens/attendance.dart';
import 'package:SIH/screens/sitewise_inventory_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: () {
                Navigator.pushNamed(context, PublicFeedbackPage.routeName);
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor1,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProjectCompletionEstimator.routeName,
                            );
                          },
                          icon: Icons.assessment,
                          text: 'Project Completion Estimator',
                        ),
                      ),
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor2,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProjectDetailsPage.routeName,
                            );
                          },
                          icon: Icons.info_outline,
                          text: 'Project Details',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor3,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DailyChecklistPage.routeName,
                            );
                          },
                          icon: Icons.check_circle_outline,
                          text: 'Daily Checklist',
                        ),
                      ),
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor4,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SitewiseInventoryPage.routeName,
                            );
                          },
                          icon: Icons.account_balance,
                          text: 'Builing Quality Assurance',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor5,
                          onTap: () {
                            Navigator.pushNamed(context, Attendance.routeName);
                          },
                          icon: Icons.supervised_user_circle,
                          text: 'Contruction Workers',
                        ),
                      ),
                      Expanded(
                        child: MenuItem(
                          color: kMenuColor6,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              WeeklyFeedbackPage.routeName,
                            );
                          },
                          icon: Icons.feedback,
                          text: 'Weekly Feedback',
                        ),
                      ),
                    ],
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
