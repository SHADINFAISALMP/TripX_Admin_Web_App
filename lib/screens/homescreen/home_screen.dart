import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a GlobalKey

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('admindetails')
                  .doc('admin')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var userData = snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  "WELCOME AGAIN \n  ${userData['name'].toString().toUpperCase()}",
                  style: const TextStyle(color: whitecolor),
                );
              }),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: colorteal,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
                color: whitecolor,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      key: scaffoldKey,
      backgroundColor: whitecolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                top: mediaqueryheight(0.02, context),
              )),
              mytext("Popular Destinations",
                  fontFamily: sedan,
                  fontSize: mediaqueryheight(0.025, context),
                  color: blackcolor),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              buildListView(),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView() {
    return StreamBuilder(
      stream: packageDetails.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: whitecolor, size: 60),
          );
        }
        final querySnapshot = snapshot.data as QuerySnapshot;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            final item = querySnapshot.docs[index];
            List<String> images =
                (item['imagepath'] as List<dynamic>).cast<String>();
            return buildListItem(images.first, item);
          },
        );
      },
    );
  }

  Widget buildListItem(String imagePath, QueryDocumentSnapshot<Object?> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetails(
              itemslists: item,
            ),
          ),
        );
      },
      child: Container(
        height: mediaqueryheight(0.4, context),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorteal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tour, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['packagename'],
                  fontFamily: sedan,
                  fontSize: 25,
                  color: whitecolor,
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.001, context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.place, color: whitecolor),
                  const SizedBox(width: 5),
                  mytext(item['placenames'],
                      fontFamily: sedan,
                      fontSize: 18,
                      color: whitecolor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              children: [
                const SizedBox(width: 35),
                const Icon(Icons.sunny, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['days'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 55),
                const Icon(Icons.nights_stay, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['night'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 35),
                const Icon(Icons.attach_money, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
