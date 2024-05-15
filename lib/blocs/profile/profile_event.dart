part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String newName;
  final String newEmail;
  final String newPhonenumber;
  final String newPlace;

  UpdateProfile(this.newPlace, 
      {required this.newName,
      required this.newEmail,
      required this.newPhonenumber,
      });
}
