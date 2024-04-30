import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/register_button/register_bloc.dart';

import 'package:tripx_admin_application/screens/signup_page/aignup_buttom.dart';
import 'package:tripx_admin_application/screens/signup_page/create_account_image.dart';
import 'package:tripx_admin_application/screens/signup_page/heading_welcome.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/utils/textformfields.dart';

final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is LoadingState) {
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
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("registration failed")));
        }
        if (state is Phonenumberalreadyregistered) {
          phonecontroller.clear();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Phone Number ALready registered")));
        }
      },
      child: Scaffold(
        body: Container(
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
                key: formKeyy,
                child: Column(
                  children: [
                    const HeadingWelcom(),
                    SizedBox(
                      height: mediaqueryheight(.011, context),
                    ),
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        CreateAccountImage(),
                        CameraButton(),
                      ],
                    ),
                    SizedBox(height: mediaqueryheight(0.010, context)),
                    mytext(
                      "CREATE AN ACCOUNT",
                      fontSize: mediaqueryheight(.030, context),
                      color: whitecolor,
                      fontFamily: 'sedan',
                    ),
                    SizedBox(
                      height: mediaqueryheight(.011, context),
                    ),
                    customtextformfieild(
                      'Enter Your Company Name',
                      Icons.person,
                      context,
                      controller: namecontroller,
                      validator: nameValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: mediaqueryheight(.015, context),
                    ),
                    customtextformfieild(
                      "Enter Email",
                      Icons.email,
                      context,
                      validator: emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailcontroller,
                    ),
                    SizedBox(
                      height: mediaqueryheight(.015, context),
                    ),
                    Textformfieldphonenumber(
                      validator: phoneValidator,
                      controller: phonecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    customtextformfiledpassword(
                      "Enter Password",
                      context,
                      controller: passwordcontroller,
                      validator: passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    customtextformfiledconfirmpassword(
                      "Confirm Password",
                      context,
                      controller: confirmpasswordcontroler,
                      validator: confirmPasswordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: mediaqueryheight(.011, context),
                    ),
                    const SignUpButton(),
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
