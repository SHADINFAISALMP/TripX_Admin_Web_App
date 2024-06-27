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
    return LayoutBuilder(
      builder: (context, constraints) {
        double height;
        double viewportFraction;
        bool autoPlay;
        bool enlargeCenterPage;

        if (constraints.maxWidth > 600) {
          height = 300;
          viewportFraction = 0.3;
          autoPlay = true;
          enlargeCenterPage = true;
        } else {
          height = 300;
          viewportFraction = 0.6;
          autoPlay = true;
          enlargeCenterPage = true;
        }

        return Container(
          width: double.infinity,
          height: height,
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
              height: height,
              autoPlay: autoPlay,
              viewportFraction: viewportFraction,
              enlargeCenterPage: enlargeCenterPage,
            ),
          ),
        );
      },
    );
  }
}
