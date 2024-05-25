import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/pages/ResultBMI/parts/disp_result_card_bmi.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/functions/bmi_result_effects.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/tiles_text.dart';
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

class PneumorphicDesign extends StatelessWidget {
  const PneumorphicDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: const Color(0xFF292D32),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Center(
        child: Text(
          'Dark Neumorphic',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
