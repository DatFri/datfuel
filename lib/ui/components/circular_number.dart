import 'package:datfuel/utils/colors.dart';
import 'package:flutter/material.dart';

class CircularNumberContainer extends StatelessWidget {
  final int number;
  final double containerSize;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  CircularNumberContainer({
    required this.number,
    this.containerSize = 100.0,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: AppColors.blackColor, width: 1)
      ),
      child: ClipOval(
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
