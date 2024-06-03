// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';

class PackageDetailsImageCarosel extends StatelessWidget {
  const PackageDetailsImageCarosel({
    super.key,
    required this.itemslists,
  });

  final QueryDocumentSnapshot<Object?> itemslists;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        color: whitecolor,
      ),
      child: CarouselSlider.builder(
        itemCount: itemslists['imagepath'].length,
        itemBuilder: (context, index, realIndex) {
    
          List<String> imagess =
              (itemslists['imagepath'] as List<dynamic>).cast<String>();
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagess[index],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.4,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}