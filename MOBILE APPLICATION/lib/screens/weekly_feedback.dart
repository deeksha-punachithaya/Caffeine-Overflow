import 'package:SIH/custom_widgets/button.dart';
import 'package:SIH/custom_widgets/input_box..dart';
import 'package:SIH/custom_widgets/item_of_work.dart';
import 'package:SIH/custom_widgets/materials.dart';
import 'package:SIH/utilities/weekly_feedback_data.dart';
import 'package:flutter/material.dart';

class WeeklyFeedbackPage extends StatefulWidget {
  static const routeName = "WeeklyFeedbackPage";

  @override
  _WeeklyFeedbackPageState createState() => _WeeklyFeedbackPageState();
}

class _WeeklyFeedbackPageState extends State<WeeklyFeedbackPage> {
  var actualDaysCharged = InputBox(
    hintText: 'Enter Actual Days Charged',
    labelText: 'Actual Days Charged',
    keyboardType: TextInputType.number,
  );
  var areaNumber = InputBox(
    hintText: 'Enter Area Number',
    labelText: 'Area Number',
    keyboardType: TextInputType.number,
  );
  var contractLabourersThisWeek = InputBox(
    hintText: 'Enter Contract labourers this week',
    labelText: 'Contract labourers(this week)',
    keyboardType: TextInputType.number,
  );
  var contractor = InputBox(
    hintText: 'Enter Contractor',
    labelText: 'Contractor Name',
    keyboardType: TextInputType.text,
  );
  var minimumDaysAWeek = InputBox(
    hintText: 'Enter Minimum Days a Week',
    labelText: 'Minimum Days a Week',
    keyboardType: TextInputType.number,
  );
  var numberOfPlots = InputBox(
    hintText: 'Enter Number of Plots',
    labelText: 'Number of Plots',
    keyboardType: TextInputType.number,
  );
  var percentOfContractComplete = InputBox(
    hintText: 'Enter Contract Completion %',
    labelText: 'Contract Completion %',
    keyboardType: TextInputType.number,
  );
  var typeOfWork = InputBox(
    hintText: 'Enter Type of Work',
    labelText: 'Type of Work',
    keyboardType: TextInputType.text,
  );
  var wagePerDay = InputBox(
    hintText: 'Enter Wages per Day',
    labelText: 'Wages per Day',
    keyboardType: TextInputType.number,
  );

  List<ItemOfWork> workItems = [ItemOfWork()];
  List<Materials> materials = [Materials()];

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
            'Weekly Feedback',
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
                  'Enter the details below',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              actualDaysCharged,
              areaNumber,
              contractLabourersThisWeek,
              contractor,
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Items of Work',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
              ),
              Column(
                children: workItems,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      workItems.add(ItemOfWork());
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      right: 14.0,
                      left: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Add More',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Materials',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
              ),
              Column(
                children: materials,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      materials.add(Materials());
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      right: 14.0,
                      left: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Add More',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              minimumDaysAWeek,
              numberOfPlots,
              percentOfContractComplete,
              typeOfWork,
              wagePerDay,
              Button(
                onPressed: () async {
                  Map itemsOfWorkTemp = {};
                  Map materialsTemp = {};
                  for (int i = 0; i < workItems.length; i++) {
                    itemsOfWorkTemp[workItems[i].first.input] = {
                      'Percent Complete Total':
                          int.parse(workItems[i].second.input)
                    };
                  }

                  for (int i = 0; i < materials.length; i++) {
                    materialsTemp[materials[i].first.input] = {
                      'Nos': int.parse(materials[i].second.input),
                      'Price': int.parse(materials[i].third.input),
                      'Quality': materials[i].fourth.input,
                    };
                  }

                  WeeklyFeedbackData dataToSend = WeeklyFeedbackData(
                    actualDaysCharged: int.parse(actualDaysCharged.input),
                    areaNumber: int.parse(areaNumber.input),
                    contractLabourersThisWeek:
                        int.parse(contractLabourersThisWeek.input),
                    contractor: contractor.input,
                    date: DateTime.now(),
                    itemsOfWork: itemsOfWorkTemp,
                    materials: materialsTemp,
                    minimumDaysAWeek: int.parse(minimumDaysAWeek.input),
                    numberOfPlots: int.parse(numberOfPlots.input),
                    percentOfContractComplete:
                        int.parse(percentOfContractComplete.input),
                    typeOfWork: typeOfWork.input,
                    wagePerDay: int.parse(wagePerDay.input),
                  );
                  print(dataToSend.itemsOfWork);
                  print(dataToSend.materials);
                  print(actualDaysCharged.input +
                      "," +
                      areaNumber.input +
                      "," +
                      contractLabourersThisWeek.input +
                      "," +
                      contractor.input +
                      "," +
                      minimumDaysAWeek.input +
                      "," +
                      numberOfPlots.input +
                      "," +
                      percentOfContractComplete.input +
                      "," +
                      typeOfWork.input +
                      "," +
                      wagePerDay.input);
                  await dataToSend.sendToDatabase();
                  Navigator.pop(context);
                },
                text: 'SUBMIT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
