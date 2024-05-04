import 'package:cloud_firestore/cloud_firestore.dart';

class PackageDetailsModel {
  final List<String> imagepath;
  final String accomodation;
  final String packagename;
  final String placenames;
  final String transportation;
  final String meals;
  final String activities;
  final String pricedetails;
  final String bookingdetails;
  final String additionaldetails;
  final String day;
  final String night;
  final String country;
  final String city;
  final String startdate;
  final String enddate;

  PackageDetailsModel({
    required this.imagepath,
    required this.accomodation,
    required this.meals,
    required this.activities,
    required this.pricedetails,
    required this.bookingdetails,
    required this.additionaldetails,
    required this.packagename,
    required this.placenames,
    required this.transportation,
    required this.day,
    required this.night,
    required this.country,
    required this.city,
    required this.startdate,
    required this.enddate,
  });

  Map<String, dynamic> toMap() {
    return {
      "packagename": packagename,
      'placenames': placenames,
      "days": day,
      "night": night,
      "country": country,
      "imagepath": imagepath,
      "transportation": transportation,
      "city": city,
      "startdate": startdate,
      "enddate": enddate,
      "accodamotion": accomodation,
      "meals": meals,
      "activity": activities,
      "price": pricedetails,
      "booking": bookingdetails,
      "additional": additionaldetails,
    };
  }

  factory PackageDetailsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PackageDetailsModel(
      packagename: snapshot['packagename'],
      placenames: snapshot['placenames'],
      imagepath: snapshot['imagepath'],
      accomodation: snapshot['accodamotion'],
      meals: snapshot['meals'],
      activities: snapshot['activity'],
      pricedetails: snapshot['price'],
      bookingdetails: snapshot['booking'],
      additionaldetails: snapshot['additional'],
      transportation: snapshot['transportation'],
      day: snapshot['days'],
      night: snapshot['night'],
      country: snapshot['country'],
      city: snapshot['city'],
      startdate: snapshot['startdate'],
      enddate: snapshot['enddate'],
      // Initialize other fields from the snapshot
    );
  }
}
