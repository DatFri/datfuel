import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/size_calculator.dart';
import 'bottom_navigator.dart';

class CustomButtonSelectPayment extends StatelessWidget {

  final String leftIcon;
  final String title;
  final VoidCallback onTap;
  final bool isTextBig;
  const CustomButtonSelectPayment({
    super.key,
    required this.leftIcon,
    required this.title,
    required this.onTap,
    this.isTextBig = true,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppConstants.screenWidth(context) * 0.8,
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: AppColors.datBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

        ),
        child:
           Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                      child: SvgPicture.asset(leftIcon, color: AppColors.white,)
                  ),
                  SizedBox(
                    child: Text(
                      title,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        // if isTextBig is true(which is the default), textSize is 16 else it will be 14
                        fontSize: isTextBig ? 16 : 22,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  SizedBox(
                    child: Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 18,)
                  ),
                ],
              ),
            )


    );

  }
}

