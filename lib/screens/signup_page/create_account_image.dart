import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class CreateAccountImage extends StatelessWidget {
  const CreateAccountImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileimageBloc, ProfileimageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ProfileimageBloc>().add(Imagepress());
          },
          child: CircleAvatar(
            radius: 100,
            backgroundImage: state.imageInBytes != null
                ? MemoryImage(state.imageInBytes!) as ImageProvider
                : const AssetImage("assets/image/spalsh3.jpeg"),
          ),
        );
      },
    );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 1,
      child: GestureDetector(
        onTap: () {
          context.read<ProfileimageBloc>().add(Imagepress());
        },
        child: CircleAvatar(
          radius: mediaqueryheight(0.029, context),
          backgroundColor: colorteal,
          child: Icon(
            Icons.camera_alt_outlined,
            size: mediaqueryheight(0.035, context),
            color: whitecolor,
          ),
        ),
      ),
    );
  }
}
