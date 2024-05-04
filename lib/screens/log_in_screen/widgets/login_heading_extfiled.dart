
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/log_in_screen/donthave_account.dart';
import 'package:tripx_admin_application/screens/log_in_screen/google_sign.dart';
import 'package:tripx_admin_application/screens/log_in_screen/widgets/loginbutton_google.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/utils/textformfields.dart';

class loginheadingandTextfiled extends StatelessWidget {
  const loginheadingandTextfiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const LoginButtonGoogle(),
        SizedBox(
          height: mediaqueryheight(.1, context),
        ),
        const DontHaveAccountText()
      ],
    );
  }
}
