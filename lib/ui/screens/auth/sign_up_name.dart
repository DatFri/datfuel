import 'package:datfuel/helpers/router.dart';
import 'package:datfuel/ui/components/circular_number.dart';
import 'package:datfuel/ui/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_black_button.dart';
import '../../components/intl_phone_field_2.dart';

class SignUpName extends StatefulWidget {
  const SignUpName({super.key});

  @override
  State<SignUpName> createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  var nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      height: 40,
                    ),
                    Text(
                      'Enter your name here please',
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: sizer(true, 16, context),
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
                                  backgroundColor: AppColors.whiteColor,
                                  containerSize: 50,
                                  textColor: AppColors.blackColor,
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
                                  backgroundColor: AppColors.whiteColor,
                                  containerSize: 50,
                                  textColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'OTP Code',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.blackColor,
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
                                  backgroundColor: AppColors.blackColor,
                                  containerSize: 50,
                                  textColor: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Finish',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.blackColor,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value'; // Error message to display
                        }
                        return null; // Return null if the input is valid
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: sizer(true, 16, context),
                              fontWeight: FontWeight.w500),
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(height:30),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Did not receive OTP?',
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: sizer(true, 13, context),
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                              letterSpacing: 0.24,
                            ),
                          ),
                          TextButton(onPressed: (){}, child:   Text(
                            'Resend',
                            style: GoogleFonts.roboto(
                              color: AppColors.datBlue,
                              fontSize: sizer(true, 14, context),
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                              letterSpacing: 0.24,
                              decoration:TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationThickness: 2,
                            ),
                          ),)
                        ],
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
                          Navigator.pushNamed(context, RouteHelper.home);
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}


class FiveDigitCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,

      length: 5, // Set the length of the code
      onChanged: (value) {
        // Handle code changes here
      },
      onCompleted: (value) {
        // Handle code submission here
      },
      // You can customize the appearance of the input fields here
      pinTheme: PinTheme(
        inactiveColor: AppColors.greyColor,
        inactiveFillColor: AppColors.greyColor,
        activeColor: Colors.black,
        shape: PinCodeFieldShape.box, // Change to underline for outline
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 56,

        fieldWidth: 56,
        selectedFillColor: AppColors.black,
        activeFillColor: AppColors.black,
      ),
    );
  }
}