import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/editprofile_widgts/savebutton.dart';

class Editprofiletextformfields extends StatelessWidget {
  const Editprofiletextformfields({
    super.key,
    required this.widget,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneNumberController,
    required TextEditingController placeController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneNumberController = phoneNumberController,
        _placeController = placeController;

  final Editprofile widget;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _placeController;

  @override
  Widget build(BuildContext context) {
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

    return Column(
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
                            ? MemoryImage(state.imageInBytes!) as ImageProvider
                            : NetworkImage(widget.imagePath),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ProfileimageBloc>().add(Imagepress());
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
            hintText: 'Enter Your Name',
            icon: Icons.person),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        _buildTextField(
            controller: _emailController,
            hintText: 'Enter Your Email',
            icon: Icons.mail),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        _buildTextField(
            controller: _phoneNumberController,
            hintText: 'Enter Your Phone number',
            icon: Icons.phone),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        _buildTextField(
            controller: _placeController,
            hintText: 'Enter Your Place',
            icon: Icons.place),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        Savechanges(
            nameController: _nameController,
            emailController: _emailController,
            phoneNumberController: _phoneNumberController,
            placeController: _placeController),
      ],
    );
  }
}
