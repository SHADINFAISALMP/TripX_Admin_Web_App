import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/homescreen/home_carousel.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/screens/packagess/packages.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

import '../../utils/fonts.dart';

class EditPackage extends StatelessWidget {
  const EditPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("EDIT PACKAGE DETAILS"),
        titleTextStyle: const TextStyle(color: whitecolor, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaqueryheight(0.02, context),
                ),
                const TopName(text: "PACKAGE PHOTOS"),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: whitecolor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  blackcolor.withOpacity(0.5), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      height: mediaqueryheight(0.2, context),
                      width: mediaquerywidht(0.84, context),
                      //change to blo
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.photo_library_sharp,
                              color: colorteal,
                              size: 35,
                            ),
                            SizedBox(
                              width: mediaquerywidht(0.03, context),
                            ),
                            mytext(
                              "ADD PHOTOS",
                              fontFamily: sedan,
                              fontSize: 25,
                              color: colorteal,
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "KASHMIR PACKAGE",
                  topname: 'PACKAGE NAME',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "KASMIR , MANALI , ETC ",
                  topname: 'DESTINATION NAMES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Daysnightsrow(
                        text: "3",
                        topname: "DAYS",
                      ),
                      Daysnightsrow(
                        text: "4",
                        topname: "NIGHTS",
                      ),
                      Daysnightsrow(
                        text: "2",
                        topname: "COUNTRIES",
                      ),
                      Daysnightsrow(
                        text: "5",
                        topname: "CITIES",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "FLIGHT , BUS ",
                  topname: 'TRANSPORTAION TYPES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: " WE PROVING HOTEL",
                  topname: 'ACCOMODATION',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "BREAKFAST AND DINNER",
                  topname: 'MEALS ',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "JUMPING , HORSE RIDING",
                  topname: 'ACTIVITIES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "25000RS",
                  topname: 'PRICE DETAILS',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "INFORMATIONS",
                  topname: 'BOOKING INFORMATION & POLICIES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const PackageDetailsContainers(
                  text: "ADITIONALSSS",
                  topname: 'ADDITIONAL INFORMATIONS',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PackageDetails(images: images)),
                          (route) => false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: orangecolor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  blackcolor.withOpacity(0.5), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      height: mediaqueryheight(0.05, context),
                      width: mediaquerywidht(0.7, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.save,
                            color: whitecolor,
                            size: 25,
                          ),
                          SizedBox(
                            width: mediaquerywidht(0.02, context),
                          ),
                          mytext("SAVE CHANGES",
                              fontFamily: sedan,
                              fontSize: 20,
                              color: whitecolor)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
