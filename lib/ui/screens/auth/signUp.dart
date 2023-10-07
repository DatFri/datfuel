import 'package:datfuel/ui/components/circular_number.dart';
import 'package:datfuel/ui/components/custom_button.dart';
import 'package:datfuel/ui/screens/auth/sign_up_code.dart';
import 'package:datfuel/ui/screens/auth/sign_up_code.dart';
import 'package:datfuel/ui/screens/auth/sign_up_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/router.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_black_button.dart';
import '../../components/intl_phone_field_2.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    String selectedCountryCode = '+1'; // Default country code

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Back",
                    style: TextStyle(color: AppColors.black, fontSize: 15),
                  )
                ],
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Create Account',
          style: GoogleFonts.roboto(
            color: AppColors.black,
            fontSize: sizer(true, 17, context),
            fontWeight: FontWeight.w600,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when the user taps on the screen
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              width: AppConstants.screenWidth(context),
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: sizer(true, 22, context),
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Enter your mobile number',
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: sizer(true, 17, context),
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: sizer(true, 60, context),
                            child: Column(
                              children: [
                                CircularNumberContainer(
                                  number: 1,
                                  backgroundColor: AppColors.blackColor,
                                  containerSize: 50,
                                  textColor: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Number',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: sizer(true, 14, context),
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          // child:
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: sizer(true, 70, context),
                                height: 2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          //),
                          Container(
                            child: Column(
                              children: [
                                CircularNumberContainer(
                                  number: 2,
                                  backgroundColor: AppColors.white,
                                  containerSize: 50,
                                  textColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'OTP Code',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: sizer(true, 14, context),
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: sizer(true, 70, context),
                                  height: 2,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          // ),
                          SizedBox(
                            width: sizer(true, 60, context),
                            child: Column(
                              children: [
                                CircularNumberContainer(
                                  number: 3,
                                  backgroundColor: AppColors.white,
                                  containerSize: 50,
                                  textColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Finish',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: sizer(true, 16, context),
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      // color: Colors.green,
                      height: sizer(true, 70, context),
                      width: sizer(true, 350, context),
                      child: IntlPhoneField(
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0), // Adjust the padding values as needed
                        ),
                        initialCountryCode:
                            'US', // Initial selected country (you can change this)
                        onChanged: (phone) {
                          print(phone
                              .completeNumber); // Use the phone number as needed
                        },
                        onCountryChanged: (phone) {
                          setState(() {
                            selectedCountryCode = phone.fullCountryCode!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomBlackButton(
                        width: AppConstants.screenWidth(context) * 0.8,
                        height: 45,
                        color: Colors.black,
                        content: "Continue",
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteHelper.signUpCodeRoute);
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
