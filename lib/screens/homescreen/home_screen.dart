import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

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
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            bottom: 15,
          ),
          child: Text(
            "WELCOME AGAIN \n TRIPX...",
            style: TextStyle(color: whitecolor),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: colorteal,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        actions: const [
          Padding(
            padding: EdgeInsets.only(bottom: 50, right: 20),
            child: Icon(
              Icons.menu,
              size: 40,
              color: whitecolor,
            ),
          )
        ],
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
                  color: blackcolor),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              buildCarousel(),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarousel() {
    return StreamBuilder(
        stream: packageDetails.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final querySnapshot = snapshot.data as QuerySnapshot;
          final packageCount = querySnapshot.docs.length;
          return CarouselSlider.builder(
              itemCount: packageCount,
              itemBuilder: (context, index, realindex) {
                final items = snapshot.data!.docs[index];
                List<String> imagess =
                    (items['imagepath'] as List<dynamic>).cast<String>();
                return buildImage(imagess.first, index, items);
              },
              options: CarouselOptions(
                  viewportFraction: 0.72,
                  enlargeCenterPage: true,
                  height: mediaqueryheight(0.45, context),
                  autoPlayCurve: Curves.linear,
                  onPageChanged: (index, reason) => null,
                  autoPlay: true));
        });
  }

  Widget buildImage(
          String imagess, int index, QueryDocumentSnapshot<Object?> items) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PackageDetails(
                    
                      itemslists: items,
                    )),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: colorteal,
          ),
          width: mediaquerywidht(0.75, context),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imagess,
                  height: 300,
                  width: mediaquerywidht(0.75, context),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.01, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on),
                  Locationame(index, items),
                ],
              )
            ],
          ),
        ),
      );

  Locationame(int index, item) {
    return mytext(item['packagename']!,
        fontFamily: sedan,
        fontSize: mediaqueryheight(0.027, context),
        color: whitecolor);
  }
}
