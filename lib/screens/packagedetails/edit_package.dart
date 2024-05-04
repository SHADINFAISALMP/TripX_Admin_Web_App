import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';

import 'package:tripx_admin_application/screens/packagess/widgets/package_widgets.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

import '../../utils/fonts.dart';

class EditPackage extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  const EditPackage({super.key, required this.itemslists});

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
                PackageDetailsContainers(
                  text: itemslists['packagename'],
                  topname: 'PACKAGE NAME',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['placenames'],
                  topname: 'DESTINATION NAMES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Daysnightsrow(
                        text: itemslists['days'],
                        topname: "DAYS",
                      ),
                      Daysnightsrow(
                        text: itemslists['night'],
                        topname: "NIGHTS",
                      ),
                      Daysnightsrow(
                        text: itemslists['country'],
                        topname: "COUNTRIES",
                      ),
                      Daysnightsrow(
                        text: itemslists['city'],
                        topname: "CITIES",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['transportation'],
                  topname: 'TRANSPORTAION TYPES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['accodamotion'],
                  topname: 'ACCOMODATION',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['meals'],
                  topname: 'MEALS ',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['activity'],
                  topname: 'ACTIVITIES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['price'],
                  topname: 'PRICE DETAILS',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['booking'],
                  topname: 'BOOKING INFORMATION & POLICIES',
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                PackageDetailsContainers(
                  text: itemslists['additional'],
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
                              builder: (context) => PackageDetails(
                                    itemslists: itemslists,
                                  )),
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
