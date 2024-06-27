import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/home_screen/home_screen_container.dart';

class Homescreencontent extends StatelessWidget {
  final bool isMobile;

  const Homescreencontent({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        StreamBuilder(
          stream: packageDetails.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: whitecolor, size: 60),
              );
            }
            final querySnapshot = snapshot.data as QuerySnapshot;
            if (isMobile) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: querySnapshot.docs.length,
                itemBuilder: (context, index) {
                  final item = querySnapshot.docs[index];
                  List<String> images =
                      (item['imagepath'] as List<dynamic>).cast<String>();
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
                    child: HomePackagecontainer(images: images, item: item),
                  );
                },
              );
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: mediaqueryheight(0.02, context),
                  crossAxisSpacing: mediaquerywidht(0.02, context),
                  childAspectRatio: 0.8,
                ),
                itemCount: querySnapshot.docs.length,
                itemBuilder: (context, index) {
                  final item = querySnapshot.docs[index];
                  List<String> images =
                      (item['imagepath'] as List<dynamic>).cast<String>();
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
                    child: HomePackagecontainer(images: images, item: item),
                  );
                },
              );
            }
          },
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
      ],
    );
  }
}
