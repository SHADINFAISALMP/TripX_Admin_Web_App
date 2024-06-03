
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_addingtwo.dart';

class PackageImage extends StatefulWidget {
  const PackageImage({super.key});

  @override
  State<PackageImage> createState() => _PackageImageState();
}

class _PackageImageState extends State<PackageImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
          toolbarHeight: mediaqueryheight(0.07, context),
          foregroundColor: whitecolor,
          backgroundColor: colorteal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          centerTitle: true,
          title: mytext("MORE DETAILS",
              fontFamily: sedan, fontSize: 24, color: whitecolor)),
      body: Column(
        children: [
          SizedBox(
            height: mediaqueryheight(0.04, context),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: colorteal,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: const SingleChildScrollView(
                child: Center(
                  child: Packageaddings(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void _showPriceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter Price Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colorteal,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3, // You can adjust this count based on requirements
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Price ${index + 1}',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: whitecolor, backgroundColor: colorteal,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
