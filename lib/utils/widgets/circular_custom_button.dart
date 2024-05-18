import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';

class CircularCustomButton extends StatelessWidget {
  const CircularCustomButton({
    super.key,
    required this.ontap,
    required this.icon,
  });

  final void Function()? ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap ?? () => debugPrint('buttons is not working !'),
      focusColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(color: Colors.grey[700], shape: BoxShape.circle),
        child: Icon(
          icon,
          color: AppPaints.WHITE_70,
        ),
      ),
    );
  }
}
