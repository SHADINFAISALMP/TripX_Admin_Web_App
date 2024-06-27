import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_admin_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_admin_application/screens/privacy_policy.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whitecolor,
          title: const Text(
            "Confirm Logout",
            style: TextStyle(color: colorteal),
          ),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(color: colorteal),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                } catch (e) {
                  print("Error signing out: $e");
                }
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(color: colorteal),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: colorteal,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('admindetails')
            .doc('admin')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: whitecolor,
                size: 60,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(
              child: Text('No data available'),
            );
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;
          String name = userData['name'];
          String email = userData['email'];
          String phoneNumber = userData['phonenumber'];
          String place = userData['place'];
          String imagePath = userData['imagepath'];

          return isLargeScreen
              ? _buildLargeScreenLayout(
                  context, name, email, phoneNumber, place, imagePath)
              : _buildSmallScreenLayout(
                  context, name, email, phoneNumber, place, imagePath);
        },
      ),
    );
  }

  Widget _buildSmallScreenLayout(BuildContext context, String name,
      String email, String phoneNumber, String place, String imagePath) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: mytext("MY PROFILE",
                  fontFamily: bodoni,
                  fontSize: 22,
                  color: whitecolor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: mediaqueryheight(0.04, context),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: orangecolor),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomRight: Radius.circular(0),
                ),
                color: whitecolor,
              ),
              height: mediaqueryheight(0.770, context),
              width: mediaquerywidht(double.infinity, context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            border: Border.all(color: orangecolor, width: 3)),
                        child: CircleAvatar(
                          backgroundColor: colorteal,
                          backgroundImage: NetworkImage(imagePath),
                          radius: 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mytext(
                      name.toUpperCase(),
                      fontFamily: sedan,
                      fontSize: mediaqueryheight(0.03, context),
                      color: colorteal,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: mediaqueryheight(0.03, context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mytext(
                            "Gmail : $email",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal,
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                          mytext(
                            "Ph No : $phoneNumber",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal,
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                          mytext(
                            "Place : $place",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal,
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.01, context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.05, context),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: mediaquerywidht(0.05, context)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: mediaqueryheight(0.02, context),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Editprofile(
                                          name: name,
                                          email: email,
                                          phoneNumber: phoneNumber,
                                          place: place,
                                          imagePath: imagePath,
                                        )),
                              );
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: colorteal,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: mediaquerywidht(0.05, context),
                                ),
                                mytext(
                                  "Edit Profile",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: colorteal,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.03, context),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.share,
                                color: colorteal,
                                size: 30,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.05, context),
                              ),
                              mytext(
                                "Share App",
                                fontFamily: sedan,
                                fontSize: 22,
                                color: colorteal,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.03, context),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PrivacyPolicy()));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.privacy_tip,
                                  color: colorteal,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: mediaquerywidht(0.05, context),
                                ),
                                mytext(
                                  "Privacy policy",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: colorteal,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryheight(0.03, context),
                          ),
                          GestureDetector(
                            onTap: () {
                              _logout(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: mediaquerywidht(0.05, context),
                                  ),
                                  mytext(
                                    "Log Out",
                                    fontFamily: sedan,
                                    fontSize: 22,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context, String name,
      String email, String phoneNumber, String place, String imagePath) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: colorteal,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mytext(
                  "MY PROFILE",
                  fontFamily: bodoni,
                  fontSize: 28,
                  color: whitecolor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: mediaqueryheight(0.04, context),
                ),
                Container(
                  height: mediaqueryheight(0.7, context),
                  width: mediaquerywidht(0.8, context),
                  decoration: BoxDecoration(
                    border: Border.all(color: orangecolor),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: whitecolor,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            border: Border.all(color: orangecolor, width: 3)),
                        child: CircleAvatar(
                          backgroundColor: colorteal,
                          backgroundImage: NetworkImage(imagePath),
                          radius: 70,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      mytext(
                        name.toUpperCase(),
                        fontFamily: sedan,
                        fontSize: mediaqueryheight(0.03, context),
                        color: colorteal,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: mediaqueryheight(0.04, context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mytext(
                              "Gmail : $email",
                              overflow: TextOverflow.ellipsis,
                              fontFamily: sedan,
                              fontSize: 20,
                              color: colorteal,
                            ),
                            SizedBox(
                              height: mediaqueryheight(0.03, context),
                            ),
                            mytext(
                              "Ph No : $phoneNumber",
                              overflow: TextOverflow.ellipsis,
                              fontFamily: sedan,
                              fontSize: 20,
                              color: colorteal,
                            ),
                            SizedBox(
                              height: mediaqueryheight(0.03, context),
                            ),
                            mytext(
                              "Place : $place",
                              overflow: TextOverflow.ellipsis,
                              fontFamily: sedan,
                              fontSize: 20,
                              color: colorteal,
                            ),
                            SizedBox(
                              height: mediaqueryheight(0.03, context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mytext(
                  "SETTINGS",
                  fontFamily: bodoni,
                  fontSize: 28,
                  color: colorteal,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: mediaqueryheight(0.1, context)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Editprofile(
                          name: name,
                          email: email,
                          phoneNumber: phoneNumber,
                          place: place,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: colorteal,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      mytext("Edit Profile",
                          fontFamily: sedan,
                          fontSize: 22,
                          color: colorteal,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.05, context),
                ),
                GestureDetector(
                  onTap: () {
                    // Implement share functionality
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: colorteal,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      mytext("Share App",
                          fontFamily: sedan,
                          fontSize: 22,
                          color: colorteal,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.05, context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicy(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.privacy_tip,
                        color: colorteal,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      mytext("Privacy policy",
                          fontFamily: sedan,
                          fontSize: 22,
                          color: colorteal,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(0.05, context),
                ),
                GestureDetector(
                  onTap: () {
                    _logout(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        mytext("Log Out",
                            fontFamily: sedan,
                            fontSize: 22,
                            color: Colors.red,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
