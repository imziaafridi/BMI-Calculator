import 'package:bmi_calculator/settings/route/route_generates.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:flutter/material.dart';

import 'pages/bmi/bmi_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B M I - C A L C U L A T O R',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const BodyIndexMassHomeView(),
      initialRoute: RoutesName.BMI_CLC,
      onGenerateRoute: RouteGenerates.generateRoutes,
    );
  }
}
