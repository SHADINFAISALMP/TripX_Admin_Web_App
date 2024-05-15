import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/loadingindicator.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

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
  XFile? imageFile; // Initialize with null
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
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: whitecolor,
        ),
        centerTitle: true,
        backgroundColor: colorteal,
        title: mytext("Edit Profile",
            fontFamily: sedan,
            fontSize: mediaqueryheight(0.029, context),
            color: whitecolor),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              BlocBuilder<ProfileimageBloc, ProfileimageState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ProfileimageBloc>().add(Imagepress());
                    },
                    child: CircleAvatar(
                      radius: 90.0,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Opacity(
                            opacity: 0.999,
                            child: CircleAvatar(
                              radius: 90.0,
                              backgroundImage: state.imageInBytes != null
                                  ? MemoryImage(state.imageInBytes!)
                                      as ImageProvider
                                  : NetworkImage(widget.imagePath),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<ProfileimageBloc>()
                                  .add(Imagepress());
                            },
                            child: const Icon(
                              Icons.photo_camera,
                              color: whitecolor,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: mediaqueryheight(0.05, context),
              ),
              _buildTextField(
                controller: _nameController,
                hintText: "Enter your name",
                icon: Icons.person,
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              _buildTextField(
                controller: _emailController,
                hintText: "Enter your email",
                icon: Icons.mail,
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              _buildTextField(
                controller: _phoneNumberController,
                hintText: "Enter your phone number",
                icon: Icons.phone,
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              _buildTextField(
                controller: _placeController,
                hintText: "Enter your place",
                icon: Icons.place,
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              InkWell(
                onTap: () {
                  _saveChanges();
                },
                child: Container(
                  height: mediaqueryheight(0.07, context),
                  width: mediaquerywidht(0.5, context),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      color: orangecolor,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: mytext("Save",
                      fontFamily: sedan, fontSize: 26, color: whitecolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() async {
    DialogUtils.showLoadingDialog(context);
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

    Navigator.pop(context);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      width: mediaquerywidht(0.9, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            height: mediaqueryheight(0.003, context),
            color: colorteal,
            backgroundColor: whitecolor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            prefixIconColor: colorteal,
            fillColor: whitecolor,
            filled: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
