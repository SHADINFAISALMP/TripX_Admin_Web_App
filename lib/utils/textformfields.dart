import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

SizedBox customtextformfieild(
  String hinttext,
  IconData icon,
  context, {
  required String? Function(String?)? validator,
  required TextEditingController controller,
  required bool isMobile,
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
}) {
  double width = isMobile ? mediaquerywidht(.9, context) : mediaquerywidht(.4, context);
  return SizedBox(
    width: width,
    child: TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: whitecolor,
        prefixIcon: Icon(icon, color: blackcolor),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.w300,
            fontFamily: sedan),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            mediaqueryheight(.011, context),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

customtextformfiledpassword(
  String hinttext,
  context, {
  required String? Function(String?)? validator,
  required TextEditingController controller,
  required bool isMobile,
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
}) {
  double width = isMobile ? mediaquerywidht(.9, context) : mediaquerywidht(.4, context);
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      bool isObscured = true;
      if (state is PasswordVisibleState) {
        isObscured = state.isVisible;
      }
      return SizedBox(
        width: width,
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator: validator,
          controller: controller,
          obscureText: isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: whitecolor,
            prefixIcon: const Icon(Icons.password_sharp, color: blackcolor),
            suffixIcon: GestureDetector(
              onTap: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(Togglepasswordviiblity(isVisible: !isObscured));
              },
              child: Icon(
                !isObscured ? Icons.visibility : Icons.visibility_off,
                color: black87,
              ),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: black54,
                fontSize: mediaqueryheight(.021, context),
                fontWeight: FontWeight.w300,
                fontFamily: sedan),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                mediaqueryheight(.011, context),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
    },
  );
}

class Textformfieldphonenumber extends StatelessWidget {
  const Textformfieldphonenumber(
      {Key? key,
      required this.validator,
      this.autovalidateMode = AutovalidateMode.disabled,
      required TextEditingController controller})
      : super(key: key);

  final String? Function(String?) validator;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidht(.9, context),
      child: TextFormField(
        controller: phonecontroller,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        autovalidateMode: autovalidateMode,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: whitecolor,
          prefixIcon: const Icon(Icons.phone, color: blackcolor),
          hintText: 'Enter phone number',
          hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.w300,
            fontFamily: sedan,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              mediaqueryheight(.011, context),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
