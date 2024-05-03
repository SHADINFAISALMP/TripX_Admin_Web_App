import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';

import 'package:tripx_admin_application/screens/packagess/widgets/package_widgets.dart';
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
                PackageFields(
                  controller: packagenamecontroller,
                  hinttext: "Package Name",
                  prefixicon: const Icon(Icons.abc),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const TopName(
                  text: "DESTINATION",
                ),
                PackageFields(
                  controller: placenamecontroller,
                  hinttext: "Destination",
                  prefixicon: const Icon(Icons.place),
                ),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const TopnameTitles(),
                const Fourcontainerdays(),
                SizedBox(
                  height: mediaqueryheight(0.01, context),
                ),
                const TopName(
                  text: "START DATE",
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<AddpackageBloc>(context)
                        .add(Startdatepressed(context));
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
                            BlocBuilder<AddpackageBloc, AddpackageState>(
                              builder: (context, state) {
                                return Text(
                                  state.startDate != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(state.startDate!)
                                      : "Start Date",
                                  style: const TextStyle(
                                      color: colorteal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                );
                              },
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
                    BlocProvider.of<AddpackageBloc>(context)
                        .add(EndDatePressed(context));
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
                            BlocBuilder<AddpackageBloc, AddpackageState>(
                              builder: (context, state) {
                                return Text(
                                  state.endDate != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(state.endDate!)
                                      : "End Date",
                                  style: const TextStyle(
                                      color: colorteal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                );
                              },
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
                const NextButton()
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
                      if (value == true) {
                        if (!selectedTransportOptions.contains(option)) {
                          selectedTransportOptions.add(option);
                        }
                      } else {
                        selectedTransportOptions.remove(option);
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
}
