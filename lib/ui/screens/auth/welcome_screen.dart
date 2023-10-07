import 'package:datfuel/utils/colors.dart';
import 'package:datfuel/utils/size_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          height: AppConstants.screenHeight(context),
            width: AppConstants.screenWidth(context),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome to Datfri", textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 60, color: AppColors.whiteColor),),
                SizedBox(height: 30,),
                Text("Customising your experience .....", style: GoogleFonts.roboto(fontSize: 20, color: AppColors.greyColor),),
                SizedBox(height: 30,),

                CircularProgressIndicator(color: AppColors.white,)

              ],

          ),
        ),
      ),
    );
  }
}
