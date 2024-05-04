import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/google_sign/google_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/screens/log_in_screen/widgets/login_heading_extfiled.dart';
import 'package:tripx_admin_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/loadingindicator.dart';

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
                DialogUtils.showLoadingDialog(context);
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
                DialogUtils.showLoadingDialog(context);
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
                child: const loginheadingandTextfiled(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


