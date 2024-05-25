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
                  color: colorteal),
              SizedBox(
                height: mediaqueryheight(0.1, context),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: packageDetails.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: colorteal,
                          size: 60,
                        ),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Column(
                        children: [
                          Image.asset(
                            "assets/image/travel.png",
                            scale: 3,
                          ),
                          mytext(
                            'BUT NOW NO PACKAGES AVAILABLE \n                        SORRY!!!!',
                            fontFamily: sedan,
                            fontSize: 18,
                            color: colorteal,
                          ),
                        ],
                      ));
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        buildListView(),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                      ],
                    );
                  }),
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
        height: mediaqueryheight(0.42, context),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.sunny, color: whitecolor),
                mytext(
                  item['days'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 5),
                const Icon(Icons.nights_stay, color: whitecolor),
                mytext(
                  item['night'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 5),
                const Icon(Icons.attach_money, color: whitecolor),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 35,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Package"),
                          content: const Text(
                              "Are you sure you want to delete this package?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () async {
                                try {
                                  await item.reference.delete();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Package deleted successfully'),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Failed to delete package: $e'),
                                    ),
                                  );
                                }

                                Navigator.of(context).pop();
                              },
                              child: const Text("Delete"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
