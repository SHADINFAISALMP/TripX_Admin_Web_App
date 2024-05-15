import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/screens/signup_page/sign_up.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

const String adminname = 'namotravels';
const String adminpassword = 'namo1234';

class LoginButtonGoogle extends StatelessWidget {
  const LoginButtonGoogle({
    super.key,
  });
  void handleLogin(BuildContext context) async {
    String enteredUsername = emailcontrollerlog.text.trim();
    String enteredPassword = passwordcontrollerlog.text.trim();

    if (enteredUsername == adminname && enteredPassword == adminpassword) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('admindetails')
          .doc('admin')
          .get();
      if (snapshot.exists) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Bottomnavigation()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Signup()));
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content:
                const Text('Incorrect username or password. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          handleLogin(context);
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
    );
  }
}
