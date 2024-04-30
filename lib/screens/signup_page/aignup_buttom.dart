import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/register_button/register_bloc.dart';

import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(.07, context),
      width: mediaquerywidht(.5, context),
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.circular(
          mediaqueryheight(.011, context),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          // if (formKeyy.currentState!.validate()) {

          // }
          context
              .read<RegisterBloc>()
              .add(RegisterButtonPressed(context: context));
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidht(.03, context),
              ),
              child: const Icon(Icons.login, color: blackcolor),
            ),
            SizedBox(
              width: mediaquerywidht(.04, context),
            ),
            mytext(
              'Sign Up',
              color: black54,
              fontSize: mediaqueryheight(.021, context),
              fontWeight: FontWeight.w400,
              fontFamily: 'sedan',
            ),
          ],
        ),
      ),
    );
  }
}
