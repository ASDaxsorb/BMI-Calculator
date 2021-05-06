import 'package:bmi_calculator/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          inactiveTrackColor: Colors.grey[600],
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
          trackHeight: 1.0,
        ),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: appRoutes(),
    );
  }
}
