import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/privacy_policy.dart';
import 'package:tripx_admin_application/widgets/login_widgets/loginbutton_google.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/utils/textformfields.dart';

class LoginheadingandTextfiled extends StatelessWidget {
  const LoginheadingandTextfiled({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: mediaqueryheight(0.2, context),
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
        customtextformfieild(
          "Enter Admin Name",
          Icons.person,
          context,
          isMobile: isMobile,
          controller: emailcontrollerlog,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: emailValidator,
        ),
        SizedBox(
          height: mediaqueryheight(.05, context),
        ),
        customtextformfiledpassword(
          'Enter Password',
          context,
          isMobile: isMobile,
          controller: passwordcontrollerlog,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: passwordValidator,
        ),
        SizedBox(
          height: mediaqueryheight(.05, context),
        ),
        const LoginButtonGoogle(),
        SizedBox(
          height: mediaqueryheight(.18, context),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
            child: const Text(
              'Click here to read privacy policy',
              style: TextStyle(
                  color: whitecolor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
