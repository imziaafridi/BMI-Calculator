import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/pages/pages_exports.dart';
import 'package:bmi_calculator/utils/utils_exports.dart';
import 'package:flutter/material.dart';

class ResultViewBMI extends StatelessWidget {
  const ResultViewBMI({
    super.key,
    this.resBMI = 0.0,
  });

  final double resBMI;

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;

    debugPrint("bmi res: $resBMI");

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
            (mqSize.height * 0.17).ph,
            // graph repesentation for bmi

            Stack(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator.adaptive(
                    value: resBMI / 100,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 10.0,
                    backgroundColor: AppPaints.GREY_900,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ResultEffectsBMI.getColorBMI(resBMI)!,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 50,
                  right: 0,
                  top: 55,
                  child: TilesText(
                    value: resBMI.toStringAsFixed(1),
                    fColor: ResultEffectsBMI.getColorBMI(resBMI),
                    fontWeight: FontWeight.w600,
                    size: 28,
                  ),
                ),
              ],
            ),

            (mqSize.height * 0.04).ph,

            // showing bmi res text/label

            TilesText(
              value: ResultEffectsBMI.getLabeledBMI(resBMI),
              fColor: ResultEffectsBMI.getColorBMI(resBMI),
              fontWeight: FontWeight.w600,
              size: 17,
            ),
            // const ExpansionTileText(
            //   value: " your body is ",
            // ),

            (mqSize.height * 0.06).ph,

            // bmi result values
            DispResultCardBMI(
              size: mqSize,
              resBMI: resBMI,
            ),
          ],
        ),
      ),
    );
  }
} // class end

