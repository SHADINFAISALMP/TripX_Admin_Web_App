import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';
import 'package:tripx_admin_application/screens/homescreen/home_carousel.dart';
import 'package:tripx_admin_application/screens/packagedetails/package_details.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a GlobalKey

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            bottom: 15,
          ),
          child: Text(
            "WELCOME AGAIN \n TRIPX...",
            style: TextStyle(color: whitecolor),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: colorteal,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        actions: const [
          Padding(
            padding: EdgeInsets.only(bottom: 50, right: 20),
            child: Icon(
              Icons.menu,
              size: 40,
              color: whitecolor,
            ),
          )
        ],
      ),
      key: scaffoldKey,
      backgroundColor: whitecolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                top: mediaqueryheight(0.02, context),
              )),
              mytext("Popular Destinations",
                  fontFamily: sedan,
                  fontSize: mediaqueryheight(0.025, context),
                  color: blackcolor),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              buildCarousel(),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              buildindicator(),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarousel() => BlocBuilder<AddpackageBloc, AddpackageState>(
        builder: (context, state) {
          return CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realindex) {
                final imagess = images[index];
                return buildImage(imagess, index);
              },
              options: CarouselOptions(
                  viewportFraction: 0.72,
                  enlargeCenterPage: true,
                  height: mediaqueryheight(0.45, context),
                  autoPlayCurve: Curves.linear,
                  onPageChanged: (index, reason) =>
                      setState(() => activeindex = index),
                  autoPlay: true));
        },
      );

  Widget buildImage(String imagess, int index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PackageDetails(
                      images: [imagess],
                    )),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: colorteal,
          ),
          width: mediaquerywidht(0.75, context),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  imagess,
                  height: 300,
                  width: mediaquerywidht(0.75, context),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.01, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on),
                  mytext(locations[index],
                      fontFamily: sedan,
                      fontSize: mediaqueryheight(0.027, context),
                      color: whitecolor),
                ],
              )
            ],
          ),
        ),
      );
}
