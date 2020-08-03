import 'package:SIH/screens/attendance.dart';
import 'package:SIH/screens/daily_checklist_page.dart';
import 'package:SIH/screens/firstscreen.dart';
import 'package:SIH/screens/home_page.dart';
import 'package:SIH/screens/project_completion_estimator.dart';
import 'package:SIH/screens/project_details_page.dart';
import 'package:SIH/screens/public_feedback_page.dart';
import 'package:SIH/screens/chatbot_page.dart';
import 'package:SIH/screens/sitewise_inventory_page.dart';
import 'package:SIH/screens/weekly_feedback.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SIH/utilities/constants.dart';
import 'package:SIH/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GharSuraksha',
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          headline1: GoogleFonts.quicksand(
            fontSize: 96,
            fontWeight: FontWeight.w200,
            letterSpacing: -1.5,
          ),
          headline2: GoogleFonts.quicksand(
            fontSize: 60,
            fontWeight: FontWeight.w200,
            letterSpacing: -0.5,
          ),
          headline3: GoogleFonts.quicksand(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
          headline4: GoogleFonts.quicksand(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headline5: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
          headline6: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          subtitle1: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          subtitle2: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: GoogleFonts.quicksand(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: GoogleFonts.quicksand(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
          iconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.7,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.7,
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          elevation: 2.0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        HomePage.routeName: (context) => HomePage(),
        ProjectCompletionEstimator.routeName: (context) =>
            ProjectCompletionEstimator(),
        ProjectDetailsPage.routeName: (context) => ProjectDetailsPage(),
        DailyChecklistPage.routeName: (context) => DailyChecklistPage(),
        SitewiseInventoryPage.routeName: (context) => SitewiseInventoryPage(),
        Attendance.routeName: (context) => Attendance(),
        PublicFeedbackPage.routeName: (context) => PublicFeedbackPage(),
        ChatbotPage.routeName: (context) => ChatbotPage(),
        WeeklyFeedbackPage.routeName: (context) => WeeklyFeedbackPage(),
        Login.routeName: (context) => Login(),
      },
    );
  }
}
