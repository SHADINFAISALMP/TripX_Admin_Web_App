import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/bottomnavigation/bottomnavigation_bloc.dart';
import 'package:tripx_admin_application/utils/bottomnavigation_list.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  late NotchBottomBarController _pageController;
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
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
      builder: (context, state) {
        return Scaffold(
            // backgroundColor: colorteal,
            body: pages[state.currentpageindex],
            bottomNavigationBar: AnimatedNotchBottomBar(
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: colorteal,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: colorteal,
                  ),
                  itemLabel: 'HOME',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.add,
                    color: whitecolor,
                  ),
                  activeItem: Icon(
                    Icons.add,
                    color: colorteal,
                  ),
                  itemLabel: 'ADD PACKAGES',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: whitecolor,
                  ),
                  activeItem: Icon(
                    Icons.person_2_sharp,
                    color: colorteal,
                  ),
                  itemLabel: 'PROFILE',
                ),
              ],
              notchBottomBarController: _pageController,
              onTap: (int value) {
                context
                    .read<BottomnavigationBloc>()
                    .add(ChangeTabEvent(pageIndex: value));
              },
              kIconSize: mediaqueryheight(.029, context),
              kBottomRadius: mediaqueryheight(.02, context),
              notchColor: whitecolor,
              color: colorteal,
              itemLabelStyle: const TextStyle(color: whitecolor, fontSize: 9),
              bottomBarHeight: mediaqueryheight(.04, context),
            ));
      },
    );
  }
}
