class PackageDetailsModel {
  final List<String> imagepath;
  final String accomodation;
  final String meals;
  final String activities;
  final String pricedetails;
  final String bookingdetails;
  final String additionaldetails;

  PackageDetailsModel(
      {required this.imagepath,
      required this.accomodation,
      required this.meals,
      required this.activities,
      required this.pricedetails,
      required this.bookingdetails,
      required this.additionaldetails});
}
