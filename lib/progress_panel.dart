import 'package:flutter/material.dart';
import 'package:sabbartask/review_panel.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:countdown/countdown.dart';
import 'dart:async';

class ProgressPanel extends StatefulWidget {
  @override
  _ProgressPanelState createState() => _ProgressPanelState();
}

class _ProgressPanelState extends State<ProgressPanel> {
  int currentStep = 1;
  bool showReview = false;

  @override
  Widget build(BuildContext context) {
    if (showReview == false) {
      Timer(Duration(seconds: 55), () {
        setState(() {
          showReview = true;
        });
      });
      Timer.periodic(Duration(seconds: 20), (seconds) {
        currentStep += 1;
        if(currentStep==4){currentStep-- ; }
        print(currentStep.toString());
        setState(() {});
      });

      return Column(
        children: <Widget>[
          Container(
            height: 20,
          ),
          Text(
            "Mahmoud Sallam",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Container(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 0.0),
                child: Column(children: <Widget>[
                  StepProgressIndicator(
                    totalSteps: 4,
                    direction: Axis.vertical,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.white,
                    currentStep: currentStep,
                  ),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "On the way ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentStep >= 1 ? Colors.black : Colors.white),
                  ),
                  Container(height: 8),
                  Text(
                    "Picked up delivery",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentStep >= 2 ? Colors.black : Colors.white),
                  ),
                  Container(height: 8),
                  Text(
                    "Near delivery destination",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentStep >= 3 ? Colors.black : Colors.white),
                  ),
                  Container(height: 8),
                  Text(
                    "Delivered Packages",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentStep >= 4 ? Colors.black : Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return ReviewPanel();
    }
  }
}
