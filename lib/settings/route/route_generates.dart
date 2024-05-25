import 'package:bmi_calculator/pages/HomeBMI/bmi_home_view.dart';
import 'package:bmi_calculator/pages/ResultBMI/result_view_bmi.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:flutter/material.dart';

class RouteGenerates {
  static Route<dynamic>? generateRoutes(RouteSettings rtSettings) {
    switch (rtSettings.name) {
      case RoutesName.BMI_CLC:
        return MaterialPageRoute(
          builder: (context) => BodyIndexMassHomeView(),
        );
      case RoutesName.BMI_RES:
        double resBMI = rtSettings.arguments as double;
        return MaterialPageRoute(
          settings: RouteSettings(arguments: resBMI),
          builder: (context) => ResultViewBMI(
            resBMI: resBMI,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const DefaultPage(),
        );
    }
  }
}

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppBarTitle(
        title: 'No Pages Found',
      ),
    );
  }
}
