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

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: isMobile
                ? Image.asset(
                    "assets/image/spalsh.jpeg",
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Black.png/220px-Black.png",
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            height: mediaqueryheight(.19, context),
            child: Center(
              child: Text(
                "TRIPX ADMIN",
                style: TextStyle(
                  fontFamily: sedan,
                  fontSize: mediaqueryheight(.04, context),
                  color: whitecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
