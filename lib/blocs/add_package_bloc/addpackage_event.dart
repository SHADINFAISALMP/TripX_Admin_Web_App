part of 'addpackage_bloc.dart';

@immutable
sealed class AddpackageEvent {}

class AddImagesEvent extends AddpackageEvent {
  final List<String> imagePaths;

  AddImagesEvent(this.imagePaths);
}

class UploadimageEvent extends AddpackageEvent {
  final BuildContext context;
  final List<XFile> images;

  UploadimageEvent(this.images, this.context);
}

final class Startdatepressed extends AddpackageEvent {
  final BuildContext context;

  Startdatepressed(this.context);
}

final class EndDatePressed extends AddpackageEvent {
  final BuildContext context;

  EndDatePressed(this.context);
}

final class Multipleimageselected extends AddpackageEvent {
  final List<XFile>? images;

  Multipleimageselected(this.images);
}

final class UnMultipleimageselected extends AddpackageEvent {}

final class PackageDetailsSaved extends AddpackageEvent {}

class Updatepackagedetails extends AddpackageEvent {
  final QueryDocumentSnapshot<Object?> itemslists;
  final String packagename;
  final String placenames;
  final String transportation;
  final String accodamotion;
  final String meals;
  final String activity;
  final String adult;
  final String hotelper;
  final String childper;
  final String booking;
  final String additional;
  final String days;
  final String night;
  final String country;
  final String city;
  final String packageamount;
  final String companycharge;
  final String startDate;
  final String endDate;

  Updatepackagedetails({
    required this.itemslists,
    required this.packagename,
    required this.placenames,
    required this.transportation,
    required this.accodamotion,
    required this.meals,
    required this.activity,
    required this.adult,
    required this.hotelper,
    required this.childper,
    required this.booking,
    required this.additional,
    required this.days,
    required this.night,
    required this.country,
    required this.city,
    required this.packageamount,
    required this.companycharge,
    required this.startDate,
    required this.endDate,
  });
}
