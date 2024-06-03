// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/data_provider/add_image_to_firebase.dart';
import 'package:tripx_admin_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_admin_application/utils/controllers.dart';

class phoneOtpAuthentication {
  sendOtp(context) async {
    debugPrint("scene error vannikinn 1");
    final String phoneNummber = "+91${phonecontroller.text.toString()}";
    debugPrint("scene error vannikinn 1");
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("too many requests. Try again later"),
          ));
        },
        codeSent: (String otpCode, int? resendToken) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtpVerification(verificationId: otpCode)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNummber);
    debugPrint("scene error vannikinn 1");
  }

  otpverifactionanddataaddingtofirebase(String verificationId, context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpcontroller.text.toString());
    debugPrint("scene error vannikinn 2");
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      await Addimagetofirebase()
          .addprofileimagetofirebase(context); // i think here another things
    });
  }
}
