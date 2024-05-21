import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/body_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultViewBMI extends StatelessWidget {
  const ResultViewBMI({super.key});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'BMI RESULT',
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
            // graph repesentation for bmi
            PieChartBMI(mqSize: mqSize),
            (mqSize.height * 0.04).ph,

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
    return Container(
      width: widget.mqSize.width * 0.5,
      height: widget.mqSize.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppPaints.GREY_900,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            sections: showSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.amber,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.cyan,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.indigo,
            value: 15,
            title: '15%',
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
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
          color: colorV == null ? Colors.amber : AppPaints.WHITE_70,
          fontWeight: fontWhtV,
          size: sizeV,
        ),
      ],
    );
  }
}
