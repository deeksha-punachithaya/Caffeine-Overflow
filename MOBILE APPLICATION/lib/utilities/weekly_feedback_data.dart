import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyFeedbackData {
  final int actualDaysCharged;
  final int areaNumber;
  final int contractLabourersThisWeek;
  final String contractor;
  final DateTime date;
  final Map itemsOfWork;
  final Map materials;
  final int minimumDaysAWeek;
  final int numberOfPlots;
  final int percentOfContractComplete;
  final String typeOfWork;
  final int wagePerDay;

  WeeklyFeedbackData({
    @required this.actualDaysCharged,
    @required this.areaNumber,
    @required this.contractLabourersThisWeek,
    @required this.contractor,
    @required this.date,
    @required this.itemsOfWork,
    @required this.materials,
    @required this.minimumDaysAWeek,
    @required this.numberOfPlots,
    @required this.percentOfContractComplete,
    @required this.typeOfWork,
    @required this.wagePerDay,
  });

  sendToDatabase() async {
    await Firestore.instance.collection('weekly_reports').add({
      'Actual days charged': actualDaysCharged,
      'Area': areaNumber,
      'Contract labourers this week': contractLabourersThisWeek,
      'Contractor': contractor,
      'Date': date,
      'Items of Work': itemsOfWork,
      'Materials': materials,
      'Minimum Days a week': minimumDaysAWeek,
      'Number of Plots': numberOfPlots,
      'Percent of contract complete': percentOfContractComplete,
      'Type of work': typeOfWork,
      'Wage per day': wagePerDay,
    });
  }
}
