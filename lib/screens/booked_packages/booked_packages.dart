import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/models/traveller_model.dart';
import 'package:tripx_admin_application/screens/booked_packages/packagedetails.dart';
import 'package:tripx_admin_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';

class Bookedpackagedshow extends StatefulWidget {
  const Bookedpackagedshow({super.key});

  @override
  State<Bookedpackagedshow> createState() => _BookedpackagedshowState();
}

class _BookedpackagedshowState extends State<Bookedpackagedshow> {
  late Future<QuerySnapshot<Map<String, dynamic>>> _bookingStream;

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
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal, size: 60),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const NoBookings();
          } else {
            return BookingList(snapshot: snapshot.data!);
          }
        },
      ),
    );
  }
}

// class BookingService {
//   static Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
//       fetchBookingStream() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final userEmail = user.email;
//         if (userEmail != null) {
//           final userQueryDocumentSnapshot = await FirebaseFirestore.instance
//               .collection('userdetails')
//               .where('email', isEqualTo: userEmail)
//               .get();
//           if (userQueryDocumentSnapshot.docs.isNotEmpty) {
//             final userDocsnapshot = userQueryDocumentSnapshot.docs.first;
//             final bookingStream = FirebaseFirestore.instance
//                 .collection('userdetails')
//                 .doc(userDocsnapshot.id)
//                 .collection('travelpackagedetails')
//                 .snapshots();
//             return bookingStream;
//           } else {
//             debugPrint('No user details found for email: $userEmail');
//           }
//         } else {
//           debugPrint('User email is null');
//         }
//       } else {
//         debugPrint('No authenticated user found');
//       }
//       return const Stream.empty();
//     } catch (e) {
//       debugPrint('Error fetching data: $e');
//       return const Stream.empty();
//     }
//   }
// }

class NoBookings extends StatelessWidget {
  const NoBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/time.png', width: 200, height: 200),
          const SizedBox(height: 20),
          Text("Currently No Bookings",
              style: TextStyle(
                fontFamily: sedan,
                fontSize: 16,
                color: colorteal,
              )),
        ],
      ),
    );
  }
}

class BookingList extends StatelessWidget {
  final QuerySnapshot snapshot;
  const BookingList({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final document = snapshot.docs[index];
        final package =
            Travelpackage.fromJson(document.data()! as Map<String, dynamic>);

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
        if (travelerInfo.isNotEmpty) {
          travelerInfo = travelerInfo.substring(0, travelerInfo.length - 2);
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fulldetalshowing(document: document),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              title: Text(
                "Booking ${index + 1}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Package Name: ${package.packagename}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Traveler Information:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    travelerInfo,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Adults: ${package.adultcount}, Children: ${package.childrencount}, Rooms: ${package.roomscount}",
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
