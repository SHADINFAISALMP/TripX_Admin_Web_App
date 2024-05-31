import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/home_screen/delete_button.dart';

class HomePackagecontainer extends StatelessWidget {
  const HomePackagecontainer({
    super.key,
    required this.images,
    required this.item,
  });

  final List<String> images;
  final QueryDocumentSnapshot<Object?> item;
  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.52, context),
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
              images.first,
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
                _checkNullOrEmpty(item['packagename']),
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
                mytext(_checkNullOrEmpty(item['placenames']),
                    fontFamily: sedan,
                    fontSize: 18,
                    color: whitecolor,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                mytext(_checkNullOrEmpty(item['packagediscription']),
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
                _checkNullOrEmpty(item['days']),
                fontFamily: sedan,
                fontSize: 18,
                color: whitecolor,
              ),
              const SizedBox(width: 5),
              const Icon(Icons.nights_stay, color: whitecolor),
              mytext(
                _checkNullOrEmpty(item['night']),
                fontFamily: sedan,
                fontSize: 18,
                color: whitecolor,
              ),
              const SizedBox(width: 5),
              const Icon(Icons.attach_money, color: whitecolor),
              mytext(
                item['packageamount'],
                fontFamily: bodoni,
                fontSize: 18,
                color: whitecolor,
              ),
              const SizedBox(width: 5),
              Deletebutton(item: item),
            ],
          ),
        ],
      ),
    );
  }
}
