import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/models/userpackagemodel.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/widgets/profile_wigets/bookingcard.dart';

class Bookedpackagedshow extends StatefulWidget {
  const Bookedpackagedshow({super.key});

  @override
  State<Bookedpackagedshow> createState() => _BookedpackagedshowState();
}

class _BookedpackagedshowState extends State<Bookedpackagedshow> {
  Future<QuerySnapshot<Map<String, dynamic>>>? _bookingStream;

  @override
  void initState() {
    super.initState();
    _bookingStream = fetchAllBookings();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchAllBookings() async {
    try {
      final bookingStream = await FirebaseFirestore.instance
          .collectionGroup('travelpackagedetails')
          .get();
      if (bookingStream.docs.isEmpty) {
        debugPrint('No bookings found in the database.');
      } else {
        debugPrint('Bookings found: ${bookingStream.docs.length}');
      }
      return bookingStream;
    } catch (e) {
      debugPrint('Error fetching bookings: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: whitecolor,
          ),
        ),
        backgroundColor: colorteal,
        title: mytext("BOOKED PACKAGES",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: _bookingStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No bookings found."));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final document = snapshot.data!.docs[index];
                final package = Travelpackage.fromJson(document.data());
                return BookingCard(package: package);
              },
            );
          }
        },
      ),
    );
  }
}
