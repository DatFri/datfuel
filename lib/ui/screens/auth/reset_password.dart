// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../helpers/router.dart';
import '../../../providers/auth.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/bottom_navigator.dart';
import '../../components/custom_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();
  var ConfirmPasswordController = TextEditingController();
  var PasswordController = TextEditingController();
  var _codeController = TextEditingController();
  var _passwordVisible;
  var _confirmPasswordVisible;
  bool _issecured = true;
  bool _isLoading = false;

  bool isLoading = false; // Track loading state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  String? _validateEmail(String? email) {
    RegExp emailRegex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _submit(BuildContext context, String email) async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      final password = PasswordController.text;
      final otp = _codeController.text;
      await authProvider.resetPassword(email, password, otp);

      // Set isLoading back to false after the operation is complete
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushNamed(
        RouteHelper.loginRoute,
      );
      showSnackbar(context, Colors.green, "Password Reset Successful");
    } catch (error) {
      String errorMessage = "An error occurred.";

      if (error is Exception) {
        final errorDetail = error.toString();
        final match = RegExp(r'msg: ([^\]]*)').firstMatch(errorDetail);
        final detail = match?.group(1);

        if (detail != null) {
          final cleanDetail = detail.replaceAll(RegExp(r',\s*ctx:.*}$'), '');
          errorMessage = "Invalid credentials. $cleanDetail";
        }
      }

      // Set isLoading back to false in case of an error
      setState(() {
        isLoading = false;
      });
      showSnackbar(context, Colors.red, error.toString());
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: const Text('Error'),
      //     content: Text(errorMessage),
      //     actions: <Widget>[
      //       TextButton(
      //         child: const Text('OK'),
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //     ],
      //   ),
      // );
    }
  }

  late final String? email;
  @override
  Widget build(BuildContext context) {
    // email = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 23,
                color: Color.fromRGBO(89, 51, 8, 1),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: GoogleFonts.nunito(
            color: Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please enter your new password and otp from your email. ',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.35,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Enter the 6-Digit Code:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              validator: (value) {
                                String? enteredCode = value;
                                if (enteredCode?.length == 6) {
                                  // Handle the 6-digit code, e.g., submit it or validate it
                                  print('Entered Code: $enteredCode');
                                } else {
                                  // Code is not 6 digits long, show an error message
                                  print('Invalid Code');
                                }
                                return null;
                              },

                              controller: _codeController,
                              keyboardType: TextInputType.number,
                              maxLength: 6, // Limit to 6 characters
                              decoration: InputDecoration(
                                hintText: '123456',
                                counterText: '', // Hide the character counter
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value'; // Error message to display
                                    }
                                    return null; // Return null if the input is valid
                                  },
                                  controller: PasswordController,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: "Please enter your password",
                                      hintStyle: TextStyle(
                                          fontSize: sizer(true, 16, context),
                                          fontWeight: FontWeight.w500),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: ConfirmPasswordController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value'; // Error message to display
                                    }
                                    if (value != PasswordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null; // Return null if the input is valid
                                  },
                                  obscureText: !_confirmPasswordVisible,
                                  decoration: InputDecoration(
                                      hintText: "Please re-enter your password",
                                      hintStyle: TextStyle(
                                          fontSize: sizer(true, 16, context),
                                          fontWeight: FontWeight.w500),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _confirmPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _confirmPasswordVisible =
                                                !_confirmPasswordVisible;
                                          });
                                        },
                                      ),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButton(
                              width: 150,
                              height: 51,
                              singleBigButton: true,
                              isTextBig: false,
                              color: AppColors.accentPurple5,
                              content: 'Continue',
                              onTap: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                if (_formkey.currentState!.validate()) {
                                  _submit(context, widget.email);
                                } else {}

                                setState(() {
                                  _isLoading = false;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _issecured = !_issecured;
        });
      },
      icon: _issecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
