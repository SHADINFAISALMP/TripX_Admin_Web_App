import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/controllers.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';
import 'package:tripx_admin_application/widgets/package_widgets/package_widgets.dart';

class Packageaddings extends StatelessWidget {
  const Packageaddings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        const TopName(text: "PACKAGE PHOTOS"),
        GestureDetector(
          onTap: () async {
            final picker = ImagePicker();
            final List<XFile> pickedImages = await picker.pickMultiImage();
            // ignore: use_build_context_synchronously
            context
                .read<AddpackageBloc>()
                .add(Multipleimageselected(pickedImages));
          },
          child: Container(
            decoration: BoxDecoration(
                color: whitecolor,
                boxShadow: [
                  BoxShadow(
                    color: blackcolor.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(2, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(15)),
            height: mediaqueryheight(0.2, context),
            width: mediaquerywidht(0.84, context),
            //change to bloc
            child: BlocBuilder<AddpackageBloc, AddpackageState>(
              builder: (context, state) => state.images != null
                  ? CarouselSlider.builder(
                      itemCount: (state.images!.length / 6).ceil(),
                      itemBuilder: (context, index, realIndex) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: state.images!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(state.images![index].path),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.photo_library_sharp,
                            color: colorteal,
                            size: 35,
                          ),
                          SizedBox(
                            width: mediaquerywidht(0.03, context),
                          ),
                          mytext(
                            "ADD PHOTOS",
                            fontFamily: sedan,
                            fontSize: 25,
                            color: colorteal,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "PACKAGE DISCRIPTION"),
        Container(
          height: mediaqueryheight(0.1, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: packagediscriptioncontrollercontroller,
            maxLines: 2,
            maxLength: 100,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write small discription about this package......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "ACCOMMODATION"),
        Container(
          height: mediaqueryheight(0.1, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: accomodationcontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText:
                  'Write the details about accommodation options like hotels , resorts......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "MEALS"),
        Container(
          height: mediaqueryheight(0.1, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: mealscontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the details about meals or food ......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "ACTIVITIES"),
        Container(
          height: mediaqueryheight(0.1, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: activitescontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the details about activities providing......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "PER ADULT"),
        Container(
          height: mediaqueryheight(0.08, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: adultcontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the cost of the per adult ',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "PER NIGHT HOTEL"),
        Container(
          height: mediaqueryheight(0.08, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: hotelpricecontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the cost of Per night hotel',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "PER CHILD"),
        Container(
          height: mediaqueryheight(0.08, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: childrencontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the cost of the per child ',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "COMPANY CHARGE"),
        Container(
          height: mediaqueryheight(0.08, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: companaychargecontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the cost of the company charge ',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "PACKAGE AMOUNT"),
        Container(
          height: mediaqueryheight(0.08, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: packageamountcontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write the cost of the package ',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "BOOKING INFORMATION"),
        Container(
          height: mediaqueryheight(0.1, context),
          width: mediaquerywidht(0.83, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: bookingcontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText:
                  'Details on how to book the trip package, including contact information, booking platforms, and any required deposits.......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const TopName(text: "ADDITIONAL INFORMATION"),
        Container(
          height: mediaqueryheight(0.15, context),
          width: mediaquerywidht(0.84, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: TextField(
            controller: additionalinforamtioncontroller,
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Write any additional details ......',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
            onTap: () {
              final images = context.read<AddpackageBloc>().state.images;
              if (images != null) {
                context
                    .read<AddpackageBloc>()
                    .add(UploadimageEvent(images: images, context: context));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: orangecolor,
                  boxShadow: [
                    BoxShadow(
                      color: blackcolor.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(2, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              height: mediaqueryheight(0.05, context),
              width: mediaquerywidht(0.7, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.save,
                    color: whitecolor,
                    size: 25,
                  ),
                  SizedBox(
                    width: mediaquerywidht(0.02, context),
                  ),
                  mytext("ADD PACKAGE",
                      fontFamily: sedan, fontSize: 20, color: whitecolor)
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.05, context),
        )
      ],
    );
  }
}
