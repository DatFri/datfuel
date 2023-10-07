import 'package:datfuel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/size_calculator.dart';

class CustomBlackButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String content;
  final VoidCallback onTap;
  final bool isTextBig, singleBigButton;
  const CustomBlackButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.content,
    required this.onTap,
    this.isTextBig = true,
    this.singleBigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(22),
          ),

        ),
        child: Center(
          child: Text(
            content,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: isTextBig
                  ? 16
                  : singleBigButton
                  ? sizer(true, 16, context)
                  : 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
