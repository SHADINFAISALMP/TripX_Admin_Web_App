import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripx_admin_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_admin_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('admindetails')
            .doc('admin')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while fetching data
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

          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: mytext(
                      "My Profile",
                      fontFamily: sedan,
                      fontSize: 22,
                      color: whitecolor,
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomRight: Radius.circular(0),
                      ),
                      color: whitecolor,
                    ),
                    height: mediaqueryheight(0.770, context),
                    width: mediaquerywidht(double.infinity, context),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: CircleAvatar(
                            backgroundColor: colorteal,
                            backgroundImage: NetworkImage(imagePath),
                            radius: 70,
                          ),
                        ),
                        mytext(
                          name,
                          fontFamily: sedan,
                          fontSize: mediaqueryheight(0.03, context),
                          color: colorteal,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: mediaqueryheight(0.03, context)),
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
                          padding: EdgeInsets.only(
                              left: mediaquerywidht(0.05, context)),
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
                                height: mediaqueryheight(0.02, context),
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
                                height: mediaqueryheight(0.02, context),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Add navigation logic for settings
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.settings,
                                      color: colorteal,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: mediaquerywidht(0.05, context),
                                    ),
                                    mytext(
                                      "Settings",
                                      fontFamily: sedan,
                                      fontSize: 22,
                                      color: colorteal,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: mediaqueryheight(0.05, context),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _logout(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
