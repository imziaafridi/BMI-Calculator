import 'package:bmi_calculator/pages/bmi/bmi_home_view.dart';
import 'package:bmi_calculator/pages/bmi_result/result_view_bmi.dart';
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
        return MaterialPageRoute(
          builder: (context) => const ResultViewBMI(),
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
