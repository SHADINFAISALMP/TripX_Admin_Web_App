import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/widgets/package_widgets/imagecaroseul_grid.dart';

import 'package:tripx_admin_application/widgets/package_widgets/package_widgets.dart';
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
  final ImagePicker _picker = ImagePicker();
  List<XFile> newImages = [];
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

    try {
      startDateController.text = DateFormat('dd-MM-yyyy')
          .format(DateFormat('dd-MM-yyyy').parse(widget.startdate));
      endDateController.text = DateFormat('dd-MM-yyyy')
          .format(DateFormat('dd-MM-yyyy').parse(widget.enddate));
    } catch (e) {
      startDateController.text =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      endDateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    }
  }

  Future<void> _pickNewImages() async {
    final pickedImages = await _picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(() {
        newImages.addAll(pickedImages);
      });
    }
  }

  void _saveChanges(List<String> imagePaths) async {
    List<String> imagePaths =
        List<String>.from(widget.itemslists['imagepath'] ?? []);
    List<String> newimagepaths = [];
    List<String> allImagePaths = [...imagePaths, ...newimagepaths];
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
      newImages: newImages,
      allImagePaths: allImagePaths,
    ));
    Navigator.pop(context, true);
  }

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime? startDate) async {
    DateTime initialDate = DateTime.now();
    ThemeData themeData = ThemeData(
      primaryColor: colorteal,
      colorScheme: const ColorScheme.light(
        primary: colorteal,
        onPrimary: whitecolor,
        onSurface: colorteal,
      ),
    );
    try {
      initialDate = DateFormat('dd-MM-yyyy').parse(controller.text);
      if (initialDate.isBefore(DateTime(2000))) {
        initialDate = DateTime(2000);
      }
    } catch (e) {
      initialDate = DateTime.now();
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
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
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {required bool readOnly, required Future<void> Function()? onTap}) {
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
            readOnly: readOnly,
            onTap: readOnly ? onTap : null,
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
                    onTap: _pickNewImages,
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
                        height: mediaqueryheight(0.23, context),
                        width: mediaquerywidht(0.84, context),
                        //change to blo
                        child: imagepaths.isEmpty && newImages.isEmpty
                            ? Center(
                                child: Text(
                                'no images available',
                                style: TextStyle(
                                  fontFamily: sedan,
                                  fontSize: 20,
                                  color: colorteal,
                                ),
                              ))
                            : ImageCarouselWithGrid(
                                imagepaths: List<String>.from(imagepaths),
                                newImages: newImages)),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.02, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: GestureDetector(
                      onTap: _pickNewImages,
                      child: Container(
                        height: mediaqueryheight(0.03, context),
                        width: mediaquerywidht(0.7, context),
                        decoration: BoxDecoration(
                            color: orangecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Click for more images if you need only",
                            style: TextStyle(
                                fontFamily: bodoni,
                                fontSize: 16,
                                color: whitecolor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('PACKAGE NAME', packagenamecontroller,
                      readOnly: false, onTap: null),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField('DESTINATION NAMES', placenamecontroller,
                      readOnly: false, onTap: null),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  BlocBuilder<AddpackageBloc, AddpackageState>(
                    builder: (context, state) {
                      return buildTextField('START DATE', startDateController,
                          readOnly: true,
                          onTap: () => _selectDate(
                              context, startDateController, state.startDate));
                    },
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  BlocBuilder<AddpackageBloc, AddpackageState>(
                    builder: (context, state) {
                      return buildTextField('END DATE', endDateController,
                          readOnly: true,
                          onTap: () => _selectDate(
                              context, endDateController, state.endDate));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: buildTextField('DAYS', dayscontroller,
                                readOnly: false, onTap: null)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(
                            child: buildTextField('NIGHTS', nightscontroller,
                                readOnly: false, onTap: null)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(
                            child: buildTextField('COUNTRY', countrycontroller,
                                readOnly: false, onTap: null)),
                        SizedBox(width: mediaquerywidht(0.02, context)),
                        Expanded(
                            child: buildTextField('CITY', citycontroller,
                                readOnly: false, onTap: null)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  buildTextField(
                      'TRANSPORTATION TYPES', transportationcontroller,
                      readOnly: false, onTap: null),
                  buildTextField('ACCOMODATION', accomodationcontroller,
                      readOnly: false, onTap: null),
                  buildTextField('MEALS', mealscontroller,
                      readOnly: false, onTap: null),
                  buildTextField('ACTIVITIES', activitescontroller,
                      readOnly: false, onTap: null),
                  buildTextField('PER ADULT', adultcontroller,
                      readOnly: false, onTap: null),
                  buildTextField('PER CHILDREN', childrencontroller,
                      readOnly: false, onTap: null),
                  buildTextField('PER NIGHT HOTEL', hotelpricecontroller,
                      readOnly: false, onTap: null),
                  buildTextField('COMPANY CHARGE', companaychargecontroller,
                      readOnly: false, onTap: null),
                  buildTextField('PACKAGE AMOUNT', packageamountcontroller,
                      readOnly: false, onTap: null),
                  buildTextField(
                      'BOOKING INFORMATION & POLICIES', bookingcontroller,
                      readOnly: false, onTap: null),
                  buildTextField(
                      'ADDITIONAL INFORMATION', additionalinforamtioncontroller,
                      readOnly: false, onTap: null),
                  SizedBox(
                    height: mediaqueryheight(0.03, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: GestureDetector(
                      onTap: () {
                        _saveChanges(imagepaths.cast<String>());
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
