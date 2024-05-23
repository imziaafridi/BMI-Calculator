import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/functions/pie_indicator_list.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/body_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultViewBMI extends StatelessWidget {
  ResultViewBMI({super.key, this.resBMI = 0.0});

  double resBMI;
  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    debugPrint("bmi res: $resBMI");

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: AppBarTitle(
          title: 'BMI RESULT = $resBMI',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.canPop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppPaints.WHITE,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            (mqSize.height * 0.05).ph,
            // graph repesentation for bmi
            PieChartBMI(mqSize: mqSize),

            (mqSize.height * 0.02).ph,

            // pie chart colors indicators
            ...List.generate(
              colorsIndicatorsList.length,
              (int index) {
                return Column(
                  children: [
                    IndicatorsBMI(
                        text: textIndicatorsList[index],
                        colorC: colorsIndicatorsList[index],
                        colorT: colorsIndicatorsList[index],
                        mqSize: mqSize),
                  ],
                );
              },
            ),

            (mqSize.height * 0.02).ph,

            // bmi result values
            DispResultCardBMI(
              size: mqSize,
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorsBMI extends StatelessWidget {
  const IndicatorsBMI({
    super.key,
    this.mqSize,
    required this.text,
    this.colorC,
    this.colorT,
  });

  final Size? mqSize;
  final String text;
  final Color? colorT;
  final Color? colorC;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // color indicator
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: colorC ?? AppPaints.GREEN_900,
            shape: BoxShape.circle,
          ),
        ),

        (mqSize!.width * 0.02).pw,

        // text for indiacator
        BodyText(
          text: text,
          size: 14,
          color: colorT ?? AppPaints.GREEN_900,
        ),
      ],
    );
  }
}

class PieChartBMI extends StatefulWidget {
  const PieChartBMI({
    super.key,
    required this.mqSize,
  });

  final Size mqSize;

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
          sections:
              showSections(), // pass bmi result value to args of showSections method
        ),
      ),
    );
  }

  List<PieChartSectionData> showSections({double? bmiResVal}) {
    return List.generate(5, (i) {
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
          return PieChartSectionData(
            color: AppPaints.GREEN_900,
            value: bmiResVal ?? 18.4,
            title: '18.4 + ',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppPaints.BLACK_900,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber[400],
            value: 25,
            title: '25 +',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppPaints.BLACK_900,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppPaints.RED_300,
            value: 30,
            title: '30 +',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppPaints.RED_600,
            value: 35,
            title: '35+',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: AppPaints.YELLOW_400,
            value: 17,
            title: '- 17',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppPaints.BLACK_900,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}

class DispResultCardBMI extends StatelessWidget {
  const DispResultCardBMI({super.key, this.size});
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppPaints.GREY_900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (size!.height * 0.02).ph,
          DispResultEntriesBMI(
            title: 'GENDER',
            value: 'MALE',
          ),
          (size!.height * 0.01).ph,
          const CustomDivider(),
          (size!.height * 0.01).ph,
          DispResultEntriesBMI(
            title: 'AGE',
            value: '21',
          ),
          (size!.height * 0.01).ph,
          const CustomDivider(),
          (size!.height * 0.01).ph,
          DispResultEntriesBMI(
            title: 'HEIGHT',
            value: '160cm',
          ),
          (size!.height * 0.01).ph,
          const CustomDivider(),
          (size!.height * 0.01).ph,
          DispResultEntriesBMI(
            title: 'WEIGHT',
            value: '65kg',
          ),
          (size!.height * 0.01).ph,
          const CustomDivider(),
          (size!.height * 0.01).ph,
          DispResultEntriesBMI(
            title: 'RESULT',
            value: '21.23',
          ),
          (size!.height * 0.02).ph,
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppPaints.WHITE_70,
      thickness: .6,
    );
  }
}

class DispResultEntriesBMI extends StatelessWidget {
  DispResultEntriesBMI({
    super.key,
    //main items
    required this.title,
    required this.value,
    //value props
    this.colorV,
    this.fontWhtV,
    this.sizeV,
    //title props
    this.colorT,
    this.fontWhtT,
    this.sizeT,
  });

  //main items
  String title;
  String value;

//value props
  final Color? colorV;
  final double? sizeV;
  final FontWeight? fontWhtV;

  //title props
  final Color? colorT;
  final double? sizeT;
  final FontWeight? fontWhtT;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyText(
          text: title,
          color: colorT,
          fontWeight: fontWhtT,
          size: sizeT,
        ),
        BodyText(
          text: value,
          color: colorV == null ? AppPaints.AMBER_900 : AppPaints.WHITE_70,
          fontWeight: fontWhtV,
          size: sizeV,
        ),
      ],
    );
  }
}
