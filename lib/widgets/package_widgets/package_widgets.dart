import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/packagedetails/packageimages.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class TopName extends StatelessWidget {
  final String text;
  const TopName({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        text,
        style: const TextStyle(color: whitecolor),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class Fourcontainerdays extends StatelessWidget {
  const Fourcontainerdays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width > 600
        ? mediaquerywidht(0.1, context)
        : mediaquerywidht(0.2, context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PackageFieldsdayandnights(
          controller: dayscontroller,
          prefixicon: const Icon(Icons.sunny),
          width: containerWidth,
        ),
        PackageFieldsdayandnights(
          controller: nightscontroller,
          prefixicon: const Icon(Icons.night_shelter),
          width: containerWidth,
        ),
        PackageFieldsdayandnights(
          controller: countrycontroller,
          prefixicon: const Icon(Icons.location_city),
          width: containerWidth,
        ),
        PackageFieldsdayandnights(
          controller: citycontroller,
          prefixicon: const Icon(Icons.location_city),
          width: containerWidth,
        ),
      ],
    );
  }
}

class PackageFields extends StatelessWidget {
  final String hinttext;
  final prefixicon;
  final TextEditingController controller;
  const PackageFields({
    super.key,
    required this.hinttext,
    required this.prefixicon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaquerywidht(0.9, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whitecolor,
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
          controller: controller,
          cursorColor: whitecolor,
          style: const TextStyle(color: colorteal),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            prefixIconColor: colorteal,
            labelStyle: const TextStyle(color: colorteal),
            hintText: hinttext,
            hintStyle: const TextStyle(
              color: colorteal,
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

class PackageFieldsdayandnights extends StatelessWidget {
  final prefixicon;
  final TextEditingController controller;
  final double width;
  const PackageFieldsdayandnights({
    super.key,
    required this.prefixicon,
    required this.controller,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whitecolor,
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
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: whitecolor,
          style: const TextStyle(color: colorteal),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            prefixIconColor: colorteal,
            labelStyle: const TextStyle(color: colorteal),
            hintStyle: const TextStyle(
              color: colorteal,
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

class TopnameTitles extends StatelessWidget {
  const TopnameTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopName(
          text: "DAYS",
        ),
        TopName(
          text: "NIGHTS",
        ),
        TopName(
          text: "COUNTRY",
        ),
        TopName(
          text: "CITIES",
        ),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PackageImage()));
        },
        child: Container(
          decoration: BoxDecoration(
              color: orangecolor, borderRadius: BorderRadius.circular(10)),
          height: mediaqueryheight(0.05, context),
          width: mediaquerywidht(0.5, context),
          child: Center(
            child: Text(
              "NEXT",
              style: TextStyle(
                  fontFamily: sedan,
                  fontSize: 24,
                  color: whitecolor,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

class Startdateandenddate extends StatelessWidget {
  final String text;
  final String topname;
  const Startdateandenddate({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.25, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        )
      ],
    );
  }
}

class PackageDetailsContainers extends StatelessWidget {
  final String text;
  final String topname;

  const PackageDetailsContainers({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.84, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        ),
      ],
    );
  }
}

class Daysnightsrow extends StatelessWidget {
  final String text;
  final String topname;

  const Daysnightsrow({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.1, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        )
      ],
    );
  }
}
