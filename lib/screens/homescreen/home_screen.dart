import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';
import 'package:tripx_admin_application/screens/booked_packages/booked_packages.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/home_screen/homescreen_content.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a GlobalKey

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
            ), // Adjust padding as needed
            child: Image.asset(
              'assets/image/logo1.png',
              color: whitecolor,
              fit: BoxFit.cover,
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('admindetails')
                    .doc('admin')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: colorteal,
                        size: 60,
                      ),
                    );
                  }
                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  return Text(
                    "WELCOME AGAIN \n  ${userData['name'].toString().toUpperCase()}",
                    style: const TextStyle(
                        color: white70, fontWeight: FontWeight.bold),
                  );
                }),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          backgroundColor: colorteal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50, right: 20),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 40,
                  color: whitecolor,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Bookedpackagedshow()));
                },
              ),
            )
          ],
        ),
      ),
      key: scaffoldKey,
      backgroundColor: whitecolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                top: mediaqueryheight(0.02, context),
              )),
              mytext("Popular Destinations",
                  fontFamily: sedan,
                  fontSize: mediaqueryheight(0.025, context),
                  fontWeight: FontWeight.bold,
                  color: colorteal),
              StreamBuilder<QuerySnapshot>(
                  stream: packageDetails.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: colorteal,
                          size: 60,
                        ),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Column(
                        children: [
                          Image.asset(
                            "assets/image/travel.png",
                            scale: 3,
                          ),
                          mytext(
                            'BUT NOW NO PACKAGES AVAILABLE \n                        SORRY!!!!',
                            fontFamily: sedan,
                            fontSize: 18,
                            color: colorteal,
                          ),
                        ],
                      ));
                    }
                    return const Homescreencontent();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
