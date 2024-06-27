// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCarouselWithGrid extends StatelessWidget {
  final List<String> imagepaths;
  final List<XFile> newImages;

  const ImageCarouselWithGrid(
      {super.key, required this.imagepaths, required this.newImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: imagepaths.length + newImages.length,
        itemBuilder: (context, index) {
          if (index < imagepaths.length) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imagepaths[index]),
                ),
              ),
            );
          } else {
            final imagePath = newImages[index - imagepaths.length].path;
            print('Image path: $imagePath');
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(imagePath)),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
