import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/google_sign/google_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';

import 'package:tripx_admin_application/screens/log_in_screen/donthave_account.dart';
import 'package:tripx_admin_application/screens/log_in_screen/google_sign.dart';
import 'package:tripx_admin_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/utils/textformfields.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bottomnavigation()));
              }
              if (state is IncorrectDetails) {
                emailcontrollerlog.clear();
                passwordcontrollerlog.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        "Incorrect Email or PAssword",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: sedan,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    backgroundColor: colorteal,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                Navigator.pop(context);
              }
              if (state is EmailNotVerified) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        "PLease Verify Your Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: sedan,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    backgroundColor: colorteal,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
              if (state is NavigateToOtpPage) {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OtpVerification(
                          // fromlogin: true,
                          verificationId: '',
                        )));
              }
              if (state is AuthenicatingUser) {
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
                                'assets/image/circle.gif',
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
          BlocListener<GoogleBloc, GoogleState>(
            listener: (context, state) {
              if (state is GoogleSuccessState) {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        "Google Sign In Success",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: sedan,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    backgroundColor: colorteal,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
              if (state is GoogleLoadingstate) {
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
                                'assets/image/circle.gif',
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
              if (state is GoogleFailureState) {
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        "Failed Log In , Please Try Again",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: sedan,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    backgroundColor: colorteal,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                Navigator.pop(context);
              }
            },
          )
        ],
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/spalsh.jpeg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: mediaqueryheight(.026, context),
                      ),
                      child: mytext(
                        "TRIPX",
                        fontFamily: 'sedan',
                        fontSize: mediaqueryheight(.05, context),
                        color: whitecolor,
                      ),
                    ),
                    mytext(
                      "WELCOME AGAIN",
                      color: whitecolor,
                      fontFamily: 'sedan',
                      fontSize: mediaqueryheight(.03, context),
                    ),
                    SizedBox(
                      height: mediaqueryheight(.16, context),
                    ),
                    const GoogleSignin(),
                    SizedBox(
                      height: mediaqueryheight(.021, context),
                    ),
                    mytext("------------------OR------------------",
                        fontSize: mediaqueryheight(.031, context),
                        color: white70,
                        fontFamily: sedan),
                    SizedBox(
                      height: mediaqueryheight(.031, context),
                    ),
                    customtextformfieild("Enter Email", Icons.email, context,
                        controller: emailcontrollerlog,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: emailValidator),
                    SizedBox(
                      height: mediaqueryheight(.05, context),
                    ),
                    customtextformfiledpassword('Enter Password', context,
                        controller: passwordcontrollerlog,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: passwordValidator),
                    SizedBox(
                      height: mediaqueryheight(.05, context),
                    ),
                    Container(
                      height: mediaqueryheight(.07, context),
                      width: mediaquerywidht(.4, context),
                      decoration: BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.circular(
                          mediaqueryheight(.011, context),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          () {
                            context.read<LoginBloc>().add(LoginEventButton());
                            return null;
                          }();
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: mediaquerywidht(.03, context),
                              ),
                              child: const Icon(Icons.login, color: blackcolor),
                            ),
                            SizedBox(
                              width: mediaquerywidht(.04, context),
                            ),
                            mytext('Log in',
                                color: black54,
                                fontSize: mediaqueryheight(.029, context),
                                fontWeight: FontWeight.w300,
                                fontFamily: sedan),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryheight(.1, context),
                    ),
                    const DontHaveAccountText()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
