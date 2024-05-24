part of 'addpackage_bloc.dart';

@immutable
sealed class AddpackageEvent {}

class AddImagesEvent extends AddpackageEvent {
  final List<String> imagePaths;

  AddImagesEvent(this.imagePaths);
}
class Updatepackagedetails extends AddImagesEvent{
  Updatepackagedetails(super.imagePaths);
  
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
