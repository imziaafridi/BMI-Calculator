import 'package:bmi_calculator/const/app_paints.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartBMI extends StatefulWidget {
  const PieChartBMI({
    super.key,
    required this.mqSize,
    required this.resBMI,
  });

  final Size mqSize;
  final double? resBMI;

  @override
  State<PieChartBMI> createState() => _PieChartBMIState();
}

class _PieChartBMIState extends State<PieChartBMI> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mqSize.width * 0.6,
      height: widget.mqSize.height * 0.25,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback:
                (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0.0,
          sections: showSections(
              bmiResVal: widget
                  .resBMI), // pass bmi result value to args of showSections method
        ),
      ),
    );
  }

  List<PieChartSectionData> showSections({double? bmiResVal}) {
    return List.generate(0, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 90.0 : 70.0;

      const shadows = [
        Shadow(
          color: AppPaints.GREY_400,
          blurRadius: 2,
        ),
      ];
      switch (i) {
        case 0:
          if (bmiResVal! > 0.0 && bmiResVal <= 17.0) {
            return PieChartSectionData(
              color: AppPaints.GREY_900,
              value: bmiResVal,
              title: 'underweight',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppPaints.RED_300,
                shadows: shadows,
              ),
              titlePositionPercentageOffset: 0.5,
            );
          } else if (bmiResVal >= 18.0 && bmiResVal <= 25.0) {
            return PieChartSectionData(
              color: AppPaints.GREY_900,
              value: bmiResVal,
              title: 'normal',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppPaints.GREEN_900,
                shadows: shadows,
              ),
              titlePositionPercentageOffset: 0.5,
            );
          } else if (bmiResVal >= 26.0 && bmiResVal <= 35.0) {
            return PieChartSectionData(
              color: AppPaints.GREY_900,
              value: bmiResVal,
              title: 'overweight',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppPaints.YELLOW_400,
                shadows: shadows,
              ),
              titlePositionPercentageOffset: 0.5,
            );
          } else {
            return PieChartSectionData(
              color: AppPaints.GREY_900,
              value: bmiResVal,
              title: 'obasity',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppPaints.RED_600,
                shadows: shadows,
              ),
              titlePositionPercentageOffset: 0.5,
            );
          }

        default:
          throw Error();
      }
    });
  }
}
