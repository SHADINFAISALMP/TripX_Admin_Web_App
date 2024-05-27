import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Savechanges extends StatelessWidget {
  const Savechanges({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneNumberController,
    required TextEditingController placeController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneNumberController = phoneNumberController,
        _placeController = placeController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _placeController;

  @override
  Widget build(BuildContext context) {
    void saveChanges() async {
      Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: colorteal,
          size: 60,
        ),
      );
      final newName = _nameController.text;
      final newEmail = _emailController.text;
      final newPhoneNumber = _phoneNumberController.text;
      final newPlace = _placeController.text;

      final Map<String, dynamic> updatedData = {
        'name': newName,
        'email': newEmail,
        'phonenumber': newPhoneNumber,
        'place': newPlace,
      };

      await FirebaseFirestore.instance
          .collection('admindetails')
          .doc('admin')
          .update(updatedData);
      Navigator.pop(context);
    }

    return InkWell(
      onTap: () {
        saveChanges();
      },
      child: Container(
        height: mediaqueryheight(0.07, context),
        width: mediaquerywidht(0.5, context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ], color: orangecolor, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child:
            mytext("Save", fontFamily: sedan, fontSize: 26, color: whitecolor),
      ),
    );
  }
}
