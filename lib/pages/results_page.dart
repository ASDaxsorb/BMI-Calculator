import 'package:bmi_calculator/components/block_button.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.message, this.bmi, this.interpretation});

  final String message;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIM CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              'Your Result',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
          ReusableCard(
            color: kActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  message.toUpperCase(),
                  style: kOverweightTitle,
                ),
                Text(
                  bmi,
                  style: kOverweightNumber,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                )
              ],
            ),
          ),
          BlockButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'RE-CALCULATE',
                  style: kNumberTextStyle,
                ),
                Icon(FontAwesomeIcons.calculator)
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
