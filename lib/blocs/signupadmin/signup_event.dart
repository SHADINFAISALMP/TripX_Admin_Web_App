// ignore_for_file: prefer_typing_uninitialized_variables

part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class Confirmpassword extends SignupEvent {
  final bool isconfirmpassword;

  Confirmpassword({required this.isconfirmpassword});
}

final class Signupbuttonpress extends SignupEvent {
  final BuildContext context;

  Signupbuttonpress(this.context);
}

final class Otpvalidation extends SignupEvent {
  final BuildContext context;

  Otpvalidation({required this.context});
}

final class SubmitotpbuttonPressed extends SignupEvent {
  final String verificationID;
  final context;

  SubmitotpbuttonPressed(this.context, {required this.verificationID});
}

final class AuthenticateAdminDetails extends SignupEvent {
  final BuildContext context;

  AuthenticateAdminDetails(this.context);
}

final class VerifyEmailPressed extends SignupEvent {
  final BuildContext context;

  VerifyEmailPressed(this.context);
}

final class ResendEmailButtonPressed extends SignupEvent {}
