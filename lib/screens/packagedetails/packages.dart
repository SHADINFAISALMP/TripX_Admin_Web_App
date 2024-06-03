import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_adding.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';

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
        title: mytext("ADD NEW PACKAGE",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AddpackageBloc, AddpackageState>(
          listener: (context, state) {
            if (state is PackageSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("SUCCESSFULLY UPLOADED")),
              );
              clearAllControllers();
            } else if (state is PackageError || state is ImageUploadError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("ERROR UPLOADED")),
              );
            }
          },
          builder: (context, state) {
            if (state is Packageloading) {
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal,
                  size: 60,
                ),
              );
            }
            return const buildcontent(); // Your main content UI here
          },
        ),
      ),
    );
  }

  void clearAllControllers() {
    packagenamecontroller.clear();
    placenamecontroller.clear();
    dayscontroller.clear();
    nightscontroller.clear();
    countrycontroller.clear();
    transportationcontroller.clear();
    citycontroller.clear();
    accomodationcontroller.clear();
    mealscontroller.clear();
    activitescontroller.clear();
    adultcontroller.clear();
    hotelpricecontroller.clear();
    childrencontroller.clear();
    bookingcontroller.clear();
    packageamountcontroller.clear();
    companaychargecontroller.clear();
    additionalinforamtioncontroller.clear();
  }
}
