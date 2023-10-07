import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../helpers/router.dart';
import '../../utils/colors.dart';
import '../../utils/size_calculator.dart';
import '../components/custom_button.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key,
      this.title,
      this.description,
      this.imageSrc,
      this.dataLength,
      this.currentIndex})
      : super(key: key);
  final String? title, imageSrc, description;
  final int? dataLength;
  final double? currentIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height * 0.15,
              ),
              SvgPicture.asset(
                'assets/pana.svg',
                fit: BoxFit.contain,
                height: 300,
                width: currentIndex != 4 ? 220 : 300,
              ),
              Container(
                color: AppColors.greyBackground,
                child: SizedBox(
                  height: sizer(false, 60, context),
                ),
              ),
              Text(
                'Welcome to Datfri',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: sizer(true, 31, context),
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: Text(
                  'Welcome to your favorite fuel station.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: sizer(true, 16, context),
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  width: width * 0.8,
                  height: 51,
                  color: AppColors.accentPurple5,
                  content: 'Create Account',
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteHelper.signUpRoute);
                  }),
              SizedBox(
                height: sizer(false, 50, context),
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding:
                   const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                   child: Text(
                     'Already have an account?',
                     textAlign: TextAlign.center,
                     style: GoogleFonts.roboto(
                       fontSize: sizer(true, 14, context),
                       color: AppColors.white,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ),
                 TextButton(onPressed: (){}, child: Text("Login"))
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
