import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/screens/packagedetails/edit_package.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/widgets/package_widgets/packagedetails_content.dart';

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
            child: Packagedetailscontent(itemslists: itemslists),
          ),
        ));
  }
}


