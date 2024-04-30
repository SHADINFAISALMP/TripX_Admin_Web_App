import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/signup_page/sign_up.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: mediaquerywidht(.1, context),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Signup())),
        child: Row(
          children: [
            mytext(
              "DON'T HAVE AN ACCOUNT?",
              color: whitecolor,
              fontFamily: sedan,
              fontWeight: FontWeight.bold,
              fontSize: mediaqueryheight(.019, context),
            ),
            mytext(
              "SIGN UP",
              color: orangecolor,
              fontFamily: sedan,
              fontWeight: FontWeight.bold,
              fontSize: mediaqueryheight(.019, context),
            ),
          ],
        ),
      ),
    );
  }
}
