import 'package:flutter/material.dart';


TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController placecontroller = TextEditingController();

TextEditingController emailcontrollerlog = TextEditingController();
TextEditingController passwordcontrollerlog = TextEditingController();

//package controllers
TextEditingController packagediscriptioncontrollercontroller = TextEditingController();
TextEditingController packagenamecontroller = TextEditingController();
TextEditingController placenamecontroller = TextEditingController();
TextEditingController startdatecontroller = TextEditingController();
TextEditingController enddatecontroller = TextEditingController();
TextEditingController transportationcontroller = TextEditingController();
TextEditingController accomodationcontroller = TextEditingController();
TextEditingController mealscontroller = TextEditingController();
TextEditingController activitescontroller = TextEditingController();
TextEditingController adultcontroller = TextEditingController();
TextEditingController hotelpricecontroller = TextEditingController();
TextEditingController childrencontroller = TextEditingController();
TextEditingController bookingcontroller = TextEditingController();
TextEditingController additionalinforamtioncontroller = TextEditingController();
TextEditingController dayscontroller = TextEditingController();
TextEditingController nightscontroller = TextEditingController();
TextEditingController countrycontroller = TextEditingController();
TextEditingController citycontroller = TextEditingController();
TextEditingController packageamountcontroller = TextEditingController();
TextEditingController companaychargecontroller = TextEditingController();

String? confirmPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != passwordcontroller.text) {
    return 'Passwords do not match';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Admin name';
  }
  // if (!adminname.) {
  //   return 'Please enter a valid email';
  // }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegExp.hasMatch(value)) {
    return 'Please enter a valid name';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must contain at least 6 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  // Check if the input consists of exactly 10 digits
  if (value.length != 10 || int.tryParse(value) == null) {
    return 'Phone number must be 10 digits';
  }
  return null;
}
