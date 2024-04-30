import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _SearchpageState();
}

class _SearchpageState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: colorteal,
        title: mytext("New Package",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          const PackageFields(
            hinttext: "Package Name",
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          const PackageFields(
            hinttext: "Destination",
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          const PackageFields(
            hinttext: "Start Date",
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          const PackageFields(
            hinttext: "End Date",
          ),
        ],
      ),
    );
  }
}

class PackageFields extends StatelessWidget {
  final String hinttext;
  const PackageFields({
    super.key,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorteal,
          boxShadow: [
            BoxShadow(
              color: blackcolor.withOpacity(0.5), // Shadow color
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: TextField(
          cursorColor: whitecolor,
          style: const TextStyle(color: whitecolor),
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: whitecolor),
            hintText: hinttext,
            hintStyle: const TextStyle(
              backgroundColor: colorteal,
              color: whitecolor,
              fontSize: 18.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: whitecolor),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
