import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';

import 'package:tripx_admin_application/screens/packagedetails/packagess/widgets/package_widgets.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

import '../../utils/fonts.dart';

class EditPackage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  final String startdate;
  final String enddate;
  const EditPackage(
      {super.key,
      required this.itemslists,
      required this.startdate,
      required this.enddate});

  @override
  State<EditPackage> createState() => _EditPackageState();
}

class _EditPackageState extends State<EditPackage> {
  TextEditingController packagenamecontroller = TextEditingController();
  TextEditingController placenamecontroller = TextEditingController();
  TextEditingController transportationcontroller = TextEditingController();
  TextEditingController accomodationcontroller = TextEditingController();
  TextEditingController mealscontroller = TextEditingController();
  TextEditingController activitescontroller = TextEditingController();
  TextEditingController adultcontroller = TextEditingController();
  TextEditingController hotelpricecontroller = TextEditingController();
  TextEditingController childrencontroller = TextEditingController();
  TextEditingController bookingcontroller = TextEditingController();
  TextEditingController additionalinforamtioncontroller =
      TextEditingController();
  TextEditingController dayscontroller = TextEditingController();
  TextEditingController nightscontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController packageamountcontroller = TextEditingController();
  TextEditingController companaychargecontroller = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Assign initial values to the controllers
    packagenamecontroller.text = widget.itemslists['packagename'];
    placenamecontroller.text = widget.itemslists['placenames'];
    transportationcontroller.text = widget.itemslists['transportation'];
    accomodationcontroller.text = widget.itemslists['accodamotion'];
    mealscontroller.text = widget.itemslists['meals'];
    activitescontroller.text = widget.itemslists['activity'];
    adultcontroller.text = widget.itemslists['adult'];
    hotelpricecontroller.text = widget.itemslists['hotelper'];
    childrencontroller.text = widget.itemslists['childper'];
    bookingcontroller.text = widget.itemslists['booking'];
    additionalinforamtioncontroller.text = widget.itemslists['additional'];
    dayscontroller.text = widget.itemslists['days'];
    nightscontroller.text = widget.itemslists['night'];
    countrycontroller.text = widget.itemslists['country'];
    citycontroller.text = widget.itemslists['city'];
    packageamountcontroller.text = widget.itemslists['packageamount'];
    companaychargecontroller.text = widget.itemslists['companycharge'];
    startDateController.text = widget.startdate;
    endDateController.text = widget.enddate;
  }

  void _saveChanges() async {
    BlocProvider.of<AddpackageBloc>(context).add(Updatepackagedetails(
      itemslists: widget.itemslists,
      packagename: packagenamecontroller.text,
      placenames: placenamecontroller.text,
      transportation: transportationcontroller.text,
      accodamotion: accomodationcontroller.text,
      meals: mealscontroller.text,
      activity: activitescontroller.text,
      adult: adultcontroller.text,
      hotelper: hotelpricecontroller.text,
      childper: childrencontroller.text,
      booking: bookingcontroller.text,
      additional: additionalinforamtioncontroller.text,
      days: dayscontroller.text,
      night: nightscontroller.text,
      country: countrycontroller.text,
      city: citycontroller.text,
      packageamount: packageamountcontroller.text,
      companycharge: companaychargecontroller.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
    ));
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
            style:
                TextStyle(color: whitecolor, fontFamily: bodoni, fontSize: 16)),
        const SizedBox(height: 8),
        SizedBox(
          width: mediaquerywidht(0.84, context),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> imagepaths = widget.itemslists['imagepath'];
    return Scaffold(
      backgroundColor: colorteal,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("EDIT PACKAGE DETAILS"),
        titleTextStyle: const TextStyle(color: whitecolor, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocListener<AddpackageBloc, AddpackageState>(
        listener: (context, state) {
       if (state is PackageUpdateSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PackageDetails(
                    itemslists: widget.itemslists,
                  ),
                ),
                (route) => false,
              );
            } else if (state is PackageError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaqueryheight(0.02, context),
                  ),
                  const TopName(text: "PACKAGE PHOTOS"),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: whitecolor,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    blackcolor.withOpacity(0.5), // Shadow color
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(2, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        height: mediaqueryheight(0.2, context),
                        width: mediaquerywidht(0.84, context),
                        //change to blo
                        child: imagepaths.isEmpty
                            ? Center(
                                child: Text(
                                'no images available',
                                style: TextStyle(
                                  fontFamily: sedan,
                                  fontSize: 20,
                                  color: colorteal,
                                ),
                              ))
                            : CarouselSlider.builder(
                                itemCount: imagepaths.length,
                                itemBuilder: (context, index, realIndex) {
                                  return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                      ),
                                      itemCount: imagepaths.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      imagepaths[index]))),
                                        );
                                      });
                                },
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: const Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('PACKAGE NAME', packagenamecontroller),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('DESTINATION NAMES', placenamecontroller),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('START DATE', startDateController),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('END DATE', endDateController),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: buildTextField('DAYS', dayscontroller)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(
                            child: buildTextField('NIGHTS', nightscontroller)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(
                            child:
                                buildTextField('COUNTRY', countrycontroller)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(child: buildTextField('CITY', citycontroller)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField(
                      'TRANSPORTATION TYPES', transportationcontroller),
                  buildTextField('ACCOMODATION', accomodationcontroller),
                  buildTextField('MEALS', mealscontroller),
                  buildTextField('ACTIVITIES', activitescontroller),
                  buildTextField('PER ADULT', adultcontroller),
                  buildTextField('PER CHILDREN', childrencontroller),
                  buildTextField('PER NIGHT HOTEL', hotelpricecontroller),
                  buildTextField('COMPANY CHARGE', companaychargecontroller),
                  buildTextField('PACKAGE AMOUNT', packageamountcontroller),
                  buildTextField(
                      'BOOKING INFORMATION & POLICIES', bookingcontroller),
                  buildTextField('ADDITIONAL INFORMATION',
                      additionalinforamtioncontroller),
                  SizedBox(
                    height: mediaqueryheight(0.03, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: GestureDetector(
                      onTap: () {
                        _saveChanges();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: orangecolor,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    blackcolor.withOpacity(0.5), // Shadow color
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(2, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        height: mediaqueryheight(0.05, context),
                        width: mediaquerywidht(0.7, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.save,
                              color: whitecolor,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaquerywidht(0.02, context),
                            ),
                            mytext("SAVE CHANGES",
                                fontFamily: sedan,
                                fontSize: 20,
                                color: whitecolor)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.03, context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
