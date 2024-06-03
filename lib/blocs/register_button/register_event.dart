// ignore_for_file: prefer_typing_uninitialized_variables

part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class RegisterButtonPressed extends RegisterEvent {
  final BuildContext context;

  RegisterButtonPressed({required this.context});
}

final class Otpvalidation extends RegisterEvent {
  final BuildContext context;

  Otpvalidation({required this.context});
}

final class SubmitOtpButtonpressed extends RegisterEvent {
  final String verificationId;
  final context;
  SubmitOtpButtonpressed(this.context, {required this.verificationId});
}

