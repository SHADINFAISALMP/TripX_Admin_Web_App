import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/register_button/register_bloc.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';

import 'package:tripx_admin_application/screens/otp_verificaation/submit_botton.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

// final GlobalKey<FormState> registerformKey = GlobalKey<FormState>();
final TextEditingController otpcontroller = TextEditingController();

class OtpVerification extends StatelessWidget {
  final String verificationId;

  const OtpVerification({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is Navigatetoregistersuccess) {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Bottomnavigation()));
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("sucessfully loged in")));
        }
      },
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: otpcontroller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "ENTER THE OTP",
                          suffixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.041, context),
                  ),
                  SubmitButtonVerify(
                    verificationId: verificationId,
                  ),
                  SizedBox(
                    height: mediaqueryheight(.091, context),
                  ),
                  // ResendEmail(

                  // ),
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
