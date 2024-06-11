import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/editprofile_widgts/editprofile_textfromfiled.dart';

class Editprofile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String place;
  final String imagePath;
  const Editprofile(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.place,
      required this.imagePath});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _placeController;
  XFile? imageFile;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _placeController = TextEditingController(text: widget.place);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: colorteal,
          ),
        ),
        centerTitle: true,
        backgroundColor: whitecolor,
        title: mytext("Edit Profile",
            fontFamily: sedan,
            fontSize: mediaqueryheight(0.029, context),
            color: colorteal),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Editprofiletextformfields(
              widget: widget,
              nameController: _nameController,
              phoneNumberController: _phoneNumberController,
              placeController: _placeController),
        ),
      ),
    );
  }
}
