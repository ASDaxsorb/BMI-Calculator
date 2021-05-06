import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/block_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CalculatorBrain calculatorBrain = CalculatorBrain();
  Gender _selectedGender;
  int _height = 170;
  int _weight = 60;
  int _age = 18;

  void _selectGender(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ReusableCard(
                          onPress: () => _selectGender(Gender.female),
                          color: _selectedGender == Gender.female
                              ? kActiveColor
                              : kInactiveColor,
                          child: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'Female',
                          ),
                        ),
                        ReusableCard(
                            onPress: () => _selectGender(Gender.male),
                            color: _selectedGender == Gender.male
                                ? kActiveColor
                                : kInactiveColor,
                            child: IconContent(
                              icon: FontAwesomeIcons.mars,
                              label: 'Male',
                            )),
                      ],
                    ),
                  ),
                  ReusableCard(
                    color: kActiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$_height',
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: _height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              _height = newValue.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        ReusableCard(
                          color: kActiveColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                '$_weight',
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RoundIconButton(
                                    onPressed: () => setState(() {
                                      if (_weight > 0) {
                                        _weight--;
                                      }
                                    }),
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                  RoundIconButton(
                                    onPressed: () => setState(() => _weight++),
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        ReusableCard(
                          color: kActiveColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age', style: kLabelTextStyle),
                              Text('$_age', style: kNumberTextStyle),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () => setState(() {
                                      if (_age > 1) {
                                        _age--;
                                      }
                                    }),
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () => setState(() => _age++),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlockButton(
            child: Text(
              'Calculate',
              style: kNumberTextStyle,
            ),
            onTap: () {
              calculatorBrain.height = _height;
              calculatorBrain.weight = _weight;
              calculatorBrain.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calculatorBrain.calculateBMI(),
                    message: calculatorBrain.bmiMessage(),
                    interpretation: calculatorBrain.resultMessage(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
