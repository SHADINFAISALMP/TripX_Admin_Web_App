import 'package:tripx_admin_application/models/package_details.dart';
import 'package:tripx_admin_application/utils/controllers.dart';


class PackagedetailsData {
  List<String> selectedTransportOptions = [];
 
  Map<String, dynamic> userData(
      List<String> imageUrls,) {
  

    final data = PackageDetailsModel(
      packagename: packagenamecontroller.text.trim(),
      placenames: placenamecontroller.text.trim(),
      day: dayscontroller.text.trim(),
      night: nightscontroller.text.trim(),
      country: countrycontroller.text.trim(),
      imagepath: imageUrls,
      transportation: selectedTransportOptions.toString(),
      city: citycontroller.text.trim(),
      startdate: startDate.toString(),
      enddate: endDate.toString(),
      accomodation: accomodationcontroller.text.trim(),
      meals: mealscontroller.text.trim(),
      activities: activitescontroller.text.trim(),
      pricedetails: pricecontroller.text.trim(),
      bookingdetails: bookingcontroller.text.trim(),
      additionaldetails: additionalinforamtioncontroller.text.trim(),
    ).toMap();
    return data;
  }
}
