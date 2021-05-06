import 'package:flutter/material.dart';

import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/pages/input_page.dart';

Map<String, WidgetBuilder> appRoutes() => _routes;

final _routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => InputPage(),
  '/results_page': (BuildContext context) => ResultsPage(),
};
