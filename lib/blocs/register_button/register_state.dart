part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  final bool buttonpressed;

  const RegisterState({required this.buttonpressed});
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial({required super.buttonpressed});
}

final class NavigateToprofile extends RegisterState {
  const NavigateToprofile({required super.buttonpressed});
}

final class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure(this.error,{required super.buttonpressed});
}

final class Networkerror extends RegisterState{
  const Networkerror({required super.buttonpressed});
  
}

final class Phonenumberalreadyregistered extends RegisterState{
  const Phonenumberalreadyregistered({required super.buttonpressed});
  
}

final class LoadingState extends RegisterState{
  const LoadingState({required super.buttonpressed});
  
}

final class Navigatetoregistersuccess extends RegisterState{
  const Navigatetoregistersuccess({required super.buttonpressed});
  
}
