import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/register_button/register_bloc.dart';

import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class SubmitButtonVerify extends StatelessWidget {
  final String verificationId;
  const SubmitButtonVerify({
    super.key, required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(.061, context),
      width: mediaquerywidht(.7, context),
      decoration: BoxDecoration(
        color: white70,
        borderRadius: BorderRadius.circular(
          mediaqueryheight(.011, context),
        ),
      ),
      child: GestureDetector(
        onTap: () async {
          submitButton(context, verificationId);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Bottomnavigation()));
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidht(.03, context),
              ),
            ),
            SizedBox(
              width: mediaquerywidht(.04, context),
            ),
            mytext(
              'VERIFY & CONTINUE',
              color: blackcolor,
              fontSize: mediaqueryheight(.021, context),
              fontWeight: FontWeight.bold,
              fontFamily: 'sedan',
            ),
          ],
        ),
      ),
    );
  }
}

submitButton(BuildContext context, String verificationId) {
  context
      .read<RegisterBloc>()
      .add(SubmitOtpButtonpressed(context, verificationId: verificationId));
  return null;
}
