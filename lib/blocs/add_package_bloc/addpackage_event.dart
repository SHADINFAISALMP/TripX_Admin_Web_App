part of 'addpackage_bloc.dart';

@immutable
sealed class AddpackageEvent {}

class AddImagesEvent extends AddpackageEvent {
  final List<String> imagePaths;

  AddImagesEvent(this.imagePaths);
}

class UploadimageEvent extends AddpackageEvent {
  final List<XFile> images;

  UploadimageEvent(this.images);
}

final class Startdatepressed extends AddpackageEvent {}

final class EndDatePressed extends AddpackageEvent {}

final class Transportationpressed extends AddpackageEvent {}

final class ImageSelected extends AddpackageEvent {}

final class PackageDetailsSaved extends AddpackageEvent {}

final class Multipleimageselected extends AddpackageEvent {
  final List<XFile>? images;

  Multipleimageselected(this.images);
}

final class UnMultipleimageselected extends AddpackageEvent {}
