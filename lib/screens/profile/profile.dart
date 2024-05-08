import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripx_admin_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';

import 'package:tripx_admin_application/utils/mediaquery.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Stream<DocumentSnapshot> profileStream;

  @override
  void initState() {
    super.initState();

    profileStream =
        FirebaseFirestore.instance.collection('admindetails').doc().snapshots();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              mytext("My Profile",
                  fontFamily: sedan, fontSize: 22, color: whitecolor),
              SizedBox(
                height: mediaqueryheight(0.04, context),
              ),
              StreamBuilder<DocumentSnapshot>(
                  stream: profileStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Text("No data available");
                    }
                    var profileData =
                        snapshot.data!.data() as Map<String, dynamic>?;
                    if (profileData == null) {
                      return const Text("No profile data available");
                    }
                    String imagePath =
                        profileData['imagepath'] ?? 'assets/image/spalsh3.jpeg';
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            bottomRight: Radius.circular(0),
                          ),
                          color: whitecolor),
                      height: mediaqueryheight(0.770, context),
                      width: mediaquerywidht(double.infinity, context),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(imagePath),
                              radius: 70,
                            ),
                          ),
                          mytext(" ${profileData['name']}",
                              fontFamily: sedan,
                              fontSize: mediaqueryheight(0.03, context),
                              color: colorteal,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          Padding(
                            padding: EdgeInsets.only(
                                top: mediaqueryheight(0.03, context)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mytext("Gmail :  ${profileData['email']}",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: sedan,
                                    fontSize: 20,
                                    color: colorteal),
                                SizedBox(
                                  height: mediaqueryheight(0.01, context),
                                ),
                                mytext("Ph No :  ${profileData['phonenumber']}",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: sedan,
                                    fontSize: 20,
                                    color: colorteal),
                                SizedBox(
                                  height: mediaqueryheight(0.01, context),
                                ),
                                mytext("Place : ${profileData['place']}",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: sedan,
                                    fontSize: 20,
                                    color: colorteal),
                                SizedBox(
                                  height: mediaqueryheight(0.01, context),
                                ),
                                mytext("Password : ${profileData['password']}",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: sedan,
                                    fontSize: 20,
                                    color: colorteal),
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
                                            builder: (context) =>
                                                const Editprofile()));
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
                                      mytext("Edit Profile",
                                          fontFamily: sedan,
                                          fontSize: 22,
                                          color: colorteal),
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
                                    mytext("Share App",
                                        fontFamily: sedan,
                                        fontSize: 22,
                                        color: colorteal),
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
                                      mytext("Settings",
                                          fontFamily: sedan,
                                          fontSize: 22,
                                          color: colorteal),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: mediaqueryheight(0.05, context),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Add logout logic here
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.logout,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: mediaquerywidht(0.05, context),
                                        ),
                                        mytext("Log Out",
                                            fontFamily: sedan,
                                            fontSize: 22,
                                            color: Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
