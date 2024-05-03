import 'package:flutter/material.dart';
import 'package:tripx_admin_application/screens/packagess/packageimages.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:intl/intl.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _SearchpageState();
}

class _SearchpageState extends State<Packages> {
  DateTime? startDate;
  DateTime? endDate;
  List<String> selectedTransportOptions = [];
  List<String> allTransportOptions = [
    'Car',
    'Bus',
    'Train',
    'Flight',
    'Cruise',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: colorteal,
        title: mytext("ADD NEW PACKAGE",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: mediaqueryheight(0.01, context),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: colorteal, borderRadius: BorderRadius.circular(20)),
            height: mediaqueryheight(0.76, context),
            width: mediaquerywidht(0.95, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaqueryheight(0.02, context),
                ),
                const TopName(
                  text: "PACKAGE NAME",
                ),
                 PackageFields(controller: packagenamecontroller,
                  hinttext: "Package Name",
                  prefixicon: const Icon(Icons.abc),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const TopName(
                  text: "DESTINATION",
                ),
                 PackageFields(controller: placenamecontroller,
                  hinttext: "Destination",
                  prefixicon: const Icon(Icons.place),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const Row(
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
                ),
                 Row(
                  children: [
                    PackageFieldsdayandnights(controller: dayscontroller,
                      prefixicon: const Icon(Icons.sunny),
                    ),
                    PackageFieldsdayandnights(controller: nightscontroller,
                      prefixicon: const Icon(Icons.night_shelter),
                    ),
                    PackageFieldsdayandnights(controller: countrycontroller,
                      prefixicon: const Icon(Icons.location_city),
                    ),
                    PackageFieldsdayandnights(controller: citycontroller,
                      prefixicon: const Icon(Icons.location_city),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const TopName(
                  text: "START DATE",
                ),
                GestureDetector(
                  onTap: () {
                    _selectStartDate(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: mediaqueryheight(0.065, context),
                      width: mediaquerywidht(0.89, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: whitecolor,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: colorteal,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              startDate != null
                                  ? DateFormat('dd-MM-yyyy').format(startDate!)
                                  : "Start Date",
                              style: const TextStyle(
                                  color: colorteal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.02, context),
                ),
                const TopName(
                  text: "END DATE",
                ),
                GestureDetector(
                  onTap: () {
                    _selectEndDate(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: mediaqueryheight(0.065, context),
                      width: mediaquerywidht(0.89, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: whitecolor,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: colorteal,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              endDate != null
                                  ? DateFormat('dd-MM-yyyy').format(endDate!)
                                  : "End Date",
                              style: const TextStyle(
                                  color: colorteal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.02, context),
                ),
                const TopName(
                  text: "TRANSPORTATION",
                ),
                GestureDetector(
                  onTap: () {
                    _showTransportationOptionsDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: mediaqueryheight(0.065, context),
                      width: mediaquerywidht(0.89, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: whitecolor,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.directions_car,
                              color: colorteal,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              selectedTransportOptions.isNotEmpty
                                  ? selectedTransportOptions.join(', ')
                                  : 'Select Transportation',
                              style: const TextStyle(
                                  color: colorteal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PackageImage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: orangecolor,
                          borderRadius: BorderRadius.circular(10)),
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
                )
              ],
            ),
          ),
        ),
      ])),
    );
  }

  Future<void> _showTransportationOptionsDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Transportation'),
          content: SingleChildScrollView(
            child: Column(
              children: allTransportOptions.map((option) {
                return CheckboxListTile(
                  title: Text(option),
                  value: selectedTransportOptions.contains(option),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          selectedTransportOptions.add(option);
                        } else {
                          selectedTransportOptions.remove(option);
                        }
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectStartDate(BuildContext context) async {
    final ThemeData themeData = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorteal,
              onPrimary: whitecolor,
              onSurface: colorteal,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: whitecolor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  void _selectEndDate(BuildContext context) async {
    final ThemeData themeData = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorteal,
              onPrimary: whitecolor,
              onSurface: colorteal,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: whitecolor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }
}

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

class PackageFields extends StatelessWidget {
  final String hinttext;
  final prefixicon;
  final  TextEditingController controller;
  const PackageFields({
    super.key,
    required this.hinttext,
    required this.prefixicon, required this.controller,
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
        child: TextField(controller: controller,
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
  final  TextEditingController controller;
  const PackageFieldsdayandnights({
    super.key,
    required this.prefixicon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaquerywidht(0.197, context),
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
        child: TextField(controller: controller,
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
