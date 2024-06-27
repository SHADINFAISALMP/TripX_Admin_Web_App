// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/data_provider/add_image_to_firebase.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Savechanges extends StatelessWidget {
  const Savechanges({
    super.key,
    required TextEditingController nameController,
    required TextEditingController phoneNumberController,
    required TextEditingController placeController,
  })  : _nameController = nameController,
        _phoneNumberController = phoneNumberController,
        _placeController = placeController;

  final TextEditingController _nameController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _placeController;

  @override
  Widget build(BuildContext context) {
    void saveChanges() async {
      try {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: whitecolor,
                size: 60,
              ),
            );
          },
        );
        final newName = _nameController.text;
        final newPhoneNumber = _phoneNumberController.text;
        final newPlace = _placeController.text;

        final Map<String, dynamic> updatedData = {
          'name': newName,
          'phonenumber': newPhoneNumber,
          'place': newPlace,
        };

        final userdoc =
            FirebaseFirestore.instance.collection('admindetails').doc('admin');
        userdoc.update(updatedData);

        if (BlocProvider.of<ProfileimageBloc>(context).state.imageInBytes !=
            null) {
          final url =
              await Addimagetofirebase().addprofileimagetofirebase(context);
          await userdoc.update({"imagepath": url});
        }
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: orangecolor,
              content: Center(
                child: Text(
                  'Profile updated successfully',
                  style: TextStyle(color: whitecolor),
                ),
              )),
        );
        Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: orangecolor,
              content: Text(
                'Failed to update profile: $e',
                style: const TextStyle(color: whitecolor),
              )),
        );
      }
    }

    return InkWell(
      onTap: () {
        saveChanges();
      },
      child: Container(
        height: mediaqueryheight(0.07, context),
        width: MediaQuery.of(context).size.width > 600
            ? mediaquerywidht(0.3, context)
            : mediaquerywidht(0.9, context),
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
