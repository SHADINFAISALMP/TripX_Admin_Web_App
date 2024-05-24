import 'package:flutter/widgets.dart';

import 'package:tripx_admin_application/models/package_details.dart';
import 'package:tripx_admin_application/utils/controllers.dart';

class PackagedetailsData {
  BuildContext context;

  PackagedetailsData(this.context);
  Map<String, dynamic> userData(List<String> imageUrls,
      {required DateTime? Function(BuildContext) getStartDate,
      required DateTime? Function(BuildContext) getEndDate}) {
    final startDate = getStartDate(context);
    final endDate = getEndDate(context);
    final formattedStartDate = startDate.toString();
    final formattedEndDate = endDate.toString();

    final data = PackageDetailsModel(
      packagename: packagenamecontroller.text.trim(),
      placenames: placenamecontroller.text.trim(),
      day: dayscontroller.text.trim(),
      night: nightscontroller.text.trim(),
      country: countrycontroller.text.trim(),
      imagepath: imageUrls,
      transportation: transportationcontroller.text.trim(),
      city: citycontroller.text.trim(),
      startdate: formattedStartDate,
      enddate: formattedEndDate,
      accomodation: accomodationcontroller.text.trim(),
      meals: mealscontroller.text.trim(),
      activities: activitescontroller.text.trim(),
      adultper: adultcontroller.text.trim(),
      bookingdetails: bookingcontroller.text.trim(),
      additionaldetails: additionalinforamtioncontroller.text.trim(),
      hotelper: hotelpricecontroller.text.trim(),
      childper: childrencontroller.text.trim(),
      packageamount: packageamountcontroller.text.trim(), companycharge: companaychargecontroller.text.trim(),
    ).toMap();
    return data;
  }
}
