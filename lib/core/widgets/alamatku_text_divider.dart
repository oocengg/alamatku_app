import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AlamatkuTextDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;
  final double thickness;
  final double space;

  const AlamatkuTextDivider({
    super.key,
    required this.text,
    this.lineColor = AppColors.dark200,
    this.textColor = AppColors.dark400,
    this.thickness = 1.0,
    this.space = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: lineColor, thickness: thickness)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: space),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider(color: lineColor, thickness: thickness)),
      ],
    );
  }
}
