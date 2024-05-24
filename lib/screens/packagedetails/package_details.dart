import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/screens/packagedetails/edit_package.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_detIails_image_carosel.dart';
import 'package:tripx_admin_application/screens/packagedetails/packagess/widgets/package_widgets.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class PackageDetails extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  const PackageDetails({Key? key, required this.itemslists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPackage(
                                  itemslists: itemslists, startdate: itemslists['startdate'], enddate: itemslists["enddate"],
                                )));
                  },
                  child: const Icon(
                    Icons.edit,
                    color: whitecolor,
                  )),
            )
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Bottomnavigation()));
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: const Text("PACKAGE DETAILS"),
          titleTextStyle: const TextStyle(color: whitecolor, fontSize: 22),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                PackageDetailsImageCarosel(itemslists: itemslists),
                Container(
                  decoration: const BoxDecoration(
                      color: colorteal,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: mediaqueryheight(0.5747, context),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mediaqueryheight(0.02, context),
                          ),
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
                                Startdateandenddate(
                                  topname: 'START DATE',
                                  text: itemslists['startdate'],
                                ),
                                Startdateandenddate(
                                  topname: 'END DATE',
                                  text: itemslists['enddate'],
                                ),
                              ],
                            ),
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
                            text: itemslists['adult'],
                            topname: 'PER ADULT',
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                          PackageDetailsContainers(
                            text: itemslists['hotelper'],
                            topname: 'PER HOTEL NIGHT',
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                          PackageDetailsContainers(
                            text: itemslists['childper'],
                            topname: 'PER CHILD',
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                          PackageDetailsContainers(
                            text: itemslists['packageamount'],
                            topname: 'PACKAGE AMOUNT',
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
                            height: mediaqueryheight(0.04, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
