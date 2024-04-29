import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/blocs/signupadmin/signup_bloc.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/screens/otp_verificaation/resend_email.dart';
import 'package:tripx_admin_application/screens/otp_verificaation/submit_botton.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class OtpVerification extends StatelessWidget {
  final bool fromlogin;
  OtpVerification({super.key, required this.fromlogin});
  final TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is NavigateHomePage) {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Bottomnavigation()));
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login Success")));
            }
            if (state is Registerfail) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("failed")));
              Navigator.pop(context);
            }
            if (state is LoadingStateOtpScreen) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              'assets/images/circle.gif',
                              color: whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is NavigateHomePage) {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Bottomnavigation()));
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login Success")));
            }
            if (state is LoadingStateLogin) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              'assets/images/circle.gif',
                              color: whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        )
      ],
      child: Scaffold(
        body: Container(
          color: colorteal,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/image/spalsh.jpeg'),
          //     fit: BoxFit.cover,
          //     filterQuality: FilterQuality.high,
          //   ),
          // ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: mediaqueryheight(.05, context),
                    ),
                    child: mytext(
                      "Verify your Phone number",
                      fontFamily: 'sedan',
                      fontSize: mediaqueryheight(.034, context),
                      color: white70,
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.09, context),
                  ),
                  Text(
                    "we just sent an code to ${phonecontroller.text}\nEnter code to verify your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'sedan',
                        fontSize: mediaqueryheight(.029, context),
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.041, context),
                  ),
                  // Form(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //         border: Border.all(color: blackcolor, width: 2)),
                  //     width: mediaquerywidht(0.23, context),
                  //     child: TextFormField(
                  //       validator: (value) {
                  //         if (value == "") {
                  //           return "please enter the otp";
                  //         } else if (value!.length < 6) {
                  //           return "otp must contian 6 digits";
                  //         } else {
                  //           return null;
                  //         }
                  //       },
                  //       enableInteractiveSelection: false,
                  //       cursorColor: Colors.blueGrey,
                  //       maxLength: 6,
                  //       controller: otpcontroller,
                  //       textAlign: TextAlign.center,
                  //       keyboardType: TextInputType.number,
                  //       style: TextStyle(
                  //           fontFamily: sedan,
                  //           fontSize: mediaqueryheight(0.027, context)),
                  //       decoration: InputDecoration(
                  //           counterText: "",
                  //           contentPadding: EdgeInsets.symmetric(
                  //               horizontal: mediaquerywidht(0.02, context)),
                  //           border: InputBorder.none,
                  //           focusedBorder: InputBorder.none),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: mediaqueryheight(.041, context),
                  ),
                  SubmitButtonVerify(
                    fromlogin: fromlogin,
                  ),
                  SizedBox(
                    height: mediaqueryheight(.091, context),
                  ),
                  ResendEmail(
                    fromlogin: fromlogin,
                  ),
                  SizedBox(
                    height: mediaqueryheight(.031, context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
