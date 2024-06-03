
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_widgets.dart';

class buildcontent extends StatelessWidget {
  const buildcontent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              PackageFields(
                controller: transportationcontroller,
                hinttext: "ADD TRANSPORT DETAILS",
                prefixicon: const Icon(Icons.abc),
              ),
              SizedBox(
                height: mediaqueryheight(0.01, context),
              ),
              const NextButton()
            ],
          ),
        ),
      ),
    ]);
  }
}
