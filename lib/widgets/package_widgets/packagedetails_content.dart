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

  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  String _checkDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    if (!RegExp(r'\d{4}-\d{2}-\d{2}').hasMatch(value)) {
      return 'Not Available';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth;
        double containerHeight = mediaqueryheight(0.5747, context);

        if (constraints.maxWidth > 600) {
          containerWidth = constraints.maxWidth * 0.6;
        } else {
          containerWidth = double.infinity;
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              PackageDetailsImageCarosel(itemslists: itemslists),
              Container(
                decoration: const BoxDecoration(
                    color: colorteal,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: containerHeight,
                width: containerWidth,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          text: _checkNullOrEmpty(itemslists['packagename']),
                          topname: 'PACKAGE NAME',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['placenames']),
                          topname: 'DESTINATION NAMES',
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(
                              itemslists['packagediscription']),
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
                                text: _checkDate(itemslists['startdate']),
                              ),
                              Startdateandenddate(
                                topname: 'END DATE',
                                text: _checkDate(itemslists['enddate']),
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
                                text: _checkNullOrEmpty(itemslists['days']),
                                topname: "DAYS",
                              ),
                              Daysnightsrow(
                                text: _checkNullOrEmpty(itemslists['night']),
                                topname: "NIGHTS",
                              ),
                              Daysnightsrow(
                                text: _checkNullOrEmpty(itemslists['country']),
                                topname: "COUNTRIES",
                              ),
                              Daysnightsrow(
                                text: _checkNullOrEmpty(itemslists['city']),
                                topname: "CITIES",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['transportation']),
                          topname: 'TRANSPORTAION TYPES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['accodamotion']),
                          topname: 'ACCOMODATION',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['meals']),
                          topname: 'MEALS ',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['activity']),
                          topname: 'ACTIVITIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['adult']),
                          topname: 'PER ADULT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['hotelper']),
                          topname: 'PER HOTEL NIGHT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['childper']),
                          topname: 'PER CHILD',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['packageamount']),
                          topname: 'PACKAGE AMOUNT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['booking']),
                          topname: 'BOOKING INFORMATION & POLICIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: _checkNullOrEmpty(itemslists['additional']),
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
        );
      },
    );
  }
}
