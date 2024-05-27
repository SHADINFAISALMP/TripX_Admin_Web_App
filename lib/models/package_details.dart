import 'package:cloud_firestore/cloud_firestore.dart';

class PackageDetailsModel {
  final List<String> imagepath;
  final String accomodation;
  final String packagename;
  final String placenames;
  final String transportation;
  final String meals;
  final String activities;
  final String adultper;
  final String hotelper;
  final String childper;
  final String bookingdetails;
  final String additionaldetails;
  final String day;
  final String night;
  final String country;
  final String city;
  final String startdate;
  final String enddate;
  final String packageamount;
  final String companycharge;
  final String packagediscription;

  PackageDetailsModel(
      {required this.packageamount, required this.packagediscription, 
      required this.imagepath,
      required this.accomodation,
      required this.meals,
      required this.activities,
      required this.adultper,
      required this.hotelper,
      required this.childper,
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
      required this.companycharge});

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
      "adult": adultper,
      "hotelper": hotelper,
      "childper": childper,
      "booking": bookingdetails,
      "additional": additionaldetails,
      "packageamount": packageamount,
      "companycharge": companycharge,
      "packagediscription":packagediscription,
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
      adultper: snapshot['adult'],
      bookingdetails: snapshot['booking'],
      additionaldetails: snapshot['additional'],
      transportation: snapshot['transportation'],
      day: snapshot['days'],
      night: snapshot['night'],
      country: snapshot['country'],
      city: snapshot['city'],
      startdate: snapshot['startdate'],
      enddate: snapshot['enddate'], hotelper: snapshot['hotelper'],
      childper: snapshot['childper'], packageamount: snapshot['packageamount'],
      companycharge: snapshot['companycharge'],
      packagediscription:snapshot['packagediscription']
      // Initialize other fields from the snapshot
    );
  }
}
