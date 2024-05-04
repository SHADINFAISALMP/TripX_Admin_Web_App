import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class LoginButtonGoogle extends StatelessWidget {
  const LoginButtonGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(.07, context),
      width: mediaquerywidht(.4, context),
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.circular(
          mediaqueryheight(.011, context),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          () {
            context.read<LoginBloc>().add(LoginEventButton());
            return null;
          }();
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
            mytext('Log in',
                color: black54,
                fontSize: mediaqueryheight(.029, context),
                fontWeight: FontWeight.w300,
                fontFamily: sedan),
          ],
        ),
      ),
    );
  }
}