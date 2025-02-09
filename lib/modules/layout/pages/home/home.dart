import 'package:flutter/material.dart';
import '/core/constants/app_assets.dart';
import '/core/theme/app_colors.dart';
import '/modules/layout/pages/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  List<Widget> pages = [
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.onyxGreen,
          borderRadius: BorderRadius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.homeICN,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.searchICN,
                ),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.exploreICN,
                ),
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.profileICN,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body:pages[0],
    );
  }
}
