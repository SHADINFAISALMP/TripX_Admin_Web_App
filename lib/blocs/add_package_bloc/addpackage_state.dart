part of 'addpackage_bloc.dart';

@immutable
class AddpackageState {
  final List<XFile>? images;

  const AddpackageState({this.images});

  AddpackageState copywith({List<XFile>? images}) =>
      AddpackageState(images: images ?? this.images);
}

class ImageUploadSuccess extends AddpackageState {
   final Map<String, String> packageimages;

  const ImageUploadSuccess({super.images, required this.packageimages});
  
  
  // final List<String> imageUrls;

 
}

class ImageUploadError extends AddpackageState {
  final String errorMessage;

  const ImageUploadError(this.errorMessage);
}

final class AddpackageInitial extends AddpackageState {}

final class Packageloading extends AddpackageState {}

final class PackageSUccess extends AddpackageState {}

final class PackageError extends AddpackageState {}

final class ImageLoaded extends AddpackageState {
  final List<String> imageUrls;

  const ImageLoaded(this.imageUrls);
}

final class ImageLoading extends AddpackageState {}

final class ImageLoadingError extends AddpackageState {}

final class StartDateChanged extends AddpackageState{}