import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/editprofile_widgts/savebutton.dart';

class Editprofiletextformfields extends StatelessWidget {
  const Editprofiletextformfields({
    Key? key,
    required this.widget,
    required TextEditingController nameController,
    required TextEditingController phoneNumberController,
    required TextEditingController placeController,
  })  : _nameController = nameController,
        _phoneNumberController = phoneNumberController,
        _placeController = placeController,
        super(key: key);

  final Editprofile widget;
  final TextEditingController _nameController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _placeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaqueryheight(0.04, context),
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
                        color: orangecolor,
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
        SizedBox(
          width: MediaQuery.of(context).size.width > 600
              ? mediaquerywidht(0.5, context)
              : mediaquerywidht(0.9, context),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: _nameController,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 600
              ? mediaquerywidht(0.5, context)
              : mediaquerywidht(0.9, context),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: _phoneNumberController,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Phone number',
              prefixIcon: const Icon(Icons.phone),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 600
              ? mediaquerywidht(0.5, context)
              : mediaquerywidht(0.9, context),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: _placeController,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Place',
              prefixIcon: const Icon(Icons.place),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.05, context),
        ),
        Savechanges(
          nameController: _nameController,
          phoneNumberController: _phoneNumberController,
          placeController: _placeController,
        ),
      ],
    );
  }
}
