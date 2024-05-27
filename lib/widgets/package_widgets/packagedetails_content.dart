import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_detIails_image_carosel.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_widgets.dart';

class Packagedetailscontent extends StatelessWidget {
  const Packagedetailscontent({
    super.key,
    required this.itemslists,
  });

  final QueryDocumentSnapshot<Object?> itemslists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PackageDetailsImageCarosel(itemslists: itemslists),
        Container(
          decoration: const BoxDecoration(
              color: colorteal,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
                  PackageDetailsContainers(
                    text: itemslists['packagediscription'],
                    topname: 'PACKAGE DISCRIPTION',
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
    );
  }
}
