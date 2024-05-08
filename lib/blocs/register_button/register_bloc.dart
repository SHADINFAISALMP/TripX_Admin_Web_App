import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/firebase_auth/phone_auth_otp.dart';
import 'package:tripx_admin_application/repository/user_registration.dart';
import 'package:tripx_admin_application/screens/signup_page/sign_up.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial(buttonpressed: false)) {
    on<RegisterButtonPressed>(_registerButtonPresed);
    on<Otpvalidation>(_otpValidation);
    on<SubmitOtpButtonpressed>(_submitotpButtonpressed);
  }

  _registerButtonPresed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(const RegisterInitial(buttonpressed: true));
    if ((formKeyy.currentState!.validate())) {
      // emit(Networkerror(buttonpressed: state.buttonpressed));
      // return;
       await AddUserDetailstoFirebase().addDataToFirebase(event.context);
      emit(LoadingState(buttonpressed: state.buttonpressed));
      add(Otpvalidation(context: event.context));
    } else {
      print("registartaion failure");
      return;
    }
  }

  _otpValidation(Otpvalidation event, Emitter<RegisterState> emit) async {
    print("scene error vannikinn 1");
    try {
      await phoneOtpAuthentication().sendOtp(event.context);
    } catch (e) {
      emit(Phonenumberalreadyregistered(buttonpressed: state.buttonpressed));
    }
  }

  _submitotpButtonpressed(
      SubmitOtpButtonpressed event, Emitter<RegisterState> emit) async {
    if (formKeyy.currentState!.validate()) {
      emit(LoadingState(buttonpressed: state.buttonpressed));
      try {
        await phoneOtpAuthentication().otpverifactionanddataaddingtofirebase(
            event.verificationId, event.context);

        emit(Navigatetoregistersuccess(buttonpressed: state.buttonpressed));
      } catch (e) {
        emit(RegisterFailure("error in verifaction",
            buttonpressed: state.buttonpressed));
        print("error inde $e");
      }
    } else {
      return;
    }
  }
}
