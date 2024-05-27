import 'package:flutter/material.dart';
import 'package:tripx_admin_application/models/userpackagemodel.dart';
import 'package:tripx_admin_application/utils/colors.dart';

class BookingCard extends StatelessWidget {
  final Travelpackage package;

  const BookingCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting traveler information
    String travelerInfo = '';
    for (int i = 0; i < package.adults!.length; i++) {
      travelerInfo +=
          '${package.adults![i].name} (${package.adults![i].age}), ';
    }
    for (int i = 0; i < package.children!.length; i++) {
      travelerInfo +=
          '${package.children![i].name} (${package.children![i].age}), ';
    }
    travelerInfo = travelerInfo.substring(0, travelerInfo.length - 2);

    return Card(
      shadowColor: colorteal,
      color: colorteal,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        title: const Text(
          "Booking",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: whitecolor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            const Text(
              "Traveler Information:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: whitecolor),
            ),
            const SizedBox(height: 4.0),
            Text(
              travelerInfo,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Adults: ${package.adultcount}, Children: ${package.childrencount}, Rooms: ${package.roomscount}",
              style: const TextStyle(fontSize: 14.0, color: whitecolor),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
