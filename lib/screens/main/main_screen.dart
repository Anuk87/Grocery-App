import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/main/favourites/favourites.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/screens/main/profile/profile.dart';
import 'package:grocery_app/screens/main/search/search.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../utils/assets_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.uid,
    super.key,
  });

  final String uid;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var setWidget;

class _MainScreenState extends State<MainScreen> {
  //---------list to store bottom navigation screens
  final List<Widget> _screens = [
    const Home(),
    const Favourites(),
    const Search(),
    const Profile(),
  ];
  int activeIndex = 0;

  void onItemtapped(int i) {
    setState(() {
      activeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        // color: AppColorss.kRed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.homeIcon,
                color: activeIndex == 0
                    ? AppColorss.primaryColor
                    : AppColorss.kAsh,
              ),
              onTap: () {
                onItemtapped(0);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.savIcon,
                color: activeIndex == 1
                    ? AppColorss.primaryColor
                    : AppColorss.kAsh,
              ),
              onTap: () {
                onItemtapped(1);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.searchIcon,
                color: activeIndex == 2
                    ? AppColorss.primaryColor
                    : AppColorss.kAsh,
              ),
              onTap: () {
                onItemtapped(2);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.profileIcon,
                color: activeIndex == 3
                    ? AppColorss.primaryColor
                    : AppColorss.kAsh,
              ),
              onTap: () {
                onItemtapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
