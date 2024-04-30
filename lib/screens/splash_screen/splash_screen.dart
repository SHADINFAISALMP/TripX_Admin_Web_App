import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    });
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/image/spalsh.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: mediaqueryheight(.9, context),
            left: mediaquerywidht(.35, context),
            child: mytext(
              "TRIPX",
              color: colortealaccent,
              fontSize: mediaqueryheight(.04, context),
              fontWeight: FontWeight.bold,
              fontFamily: sedan,
            ),
          )
        ],
      ),
    );
  }
}
