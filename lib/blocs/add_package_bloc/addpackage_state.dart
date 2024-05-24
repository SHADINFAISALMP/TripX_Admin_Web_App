part of 'addpackage_bloc.dart';

@immutable
class AddpackageState {
  final List<XFile>? images;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? formattedStartDate; // Add formatted start date
  final String? formattedEndDate;

  const AddpackageState(
      {this.formattedStartDate,
      this.formattedEndDate,
      this.startDate,
      this.endDate,
      this.images});

  AddpackageState copywith({
    List<XFile>? images,
    DateTime? startDate,
    DateTime? endDate,
    String? formattedStartDate,
    String? formattedEndDate,
  }) =>
      AddpackageState(
        images: images ?? this.images,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        formattedStartDate: formattedStartDate ?? this.formattedStartDate,
        formattedEndDate: formattedEndDate ?? this.formattedEndDate,
      );
}

class ImageUploadSuccess extends AddpackageState {
  final Map<String, String> packageImages;

  const ImageUploadSuccess(
      {List<XFile>? images,
      DateTime? startDate,
      DateTime? endDate,
      required this.packageImages,
      required Map<String, String> packageimages})
      : super(
          images: images,
          startDate: startDate,
          endDate: endDate,
        );
}

class ImageUploadError extends AddpackageState {
  final String errorMessage;

  const ImageUploadError(String string,
      {List<XFile>? images,
      DateTime? startDate,
      DateTime? endDate,
      required this.errorMessage})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class AddpackageInitial extends AddpackageState {
  const AddpackageInitial(
      {List<XFile>? images, DateTime? startDate, DateTime? endDate})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class Packageloading extends AddpackageState {
  const Packageloading(
      {List<XFile>? images, DateTime? startDate, DateTime? endDate})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class PackageSuccess extends AddpackageState {
  const PackageSuccess(
      {List<XFile>? images, DateTime? startDate, DateTime? endDate})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class PackageError extends AddpackageState {
  final String errorMessage;

  const PackageError(
      {List<XFile>? images,
      DateTime? startDate,
      DateTime? endDate,
      required this.errorMessage})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class ImageLoaded extends AddpackageState {
  final List<String> imageUrls;

  const ImageLoaded(
      {List<XFile>? images,
      DateTime? startDate,
      DateTime? endDate,
      required this.imageUrls})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class ImageLoading extends AddpackageState {
  const ImageLoading(
      {List<XFile>? images, DateTime? startDate, DateTime? endDate})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class ImageLoadingError extends AddpackageState {
  final String errorMessage;

  const ImageLoadingError(
      {List<XFile>? images,
      DateTime? startDate,
      DateTime? endDate,
      required this.errorMessage})
      : super(images: images, startDate: startDate, endDate: endDate);
}

class StartDateChanged extends AddpackageState {
  const StartDateChanged(
      {List<XFile>? images, DateTime? startDate, DateTime? endDate})
      : super(images: images, startDate: startDate, endDate: endDate);
}
class PackageUpdateSuccess extends AddpackageState{}

//  class FetchingPackageLoading extends AddpackageState{

// }

//  class FetchingPackageDetailsSucess extends AddpackageState{
//   final List<PackageDetailsModel> packageDetails;

//   FetchingPackageDetailsSucess(this.packageDetails);
// }
//   class FetchPackageDetailsFailure extends AddpackageState {
//  final String errorMessage;

//  const FetchPackageDetailsFailure(this.errorMessage);
// }