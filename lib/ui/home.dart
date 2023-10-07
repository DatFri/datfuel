import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import 'screens/HomeScreen.dart';
import 'screens/bottom_nav_bar/NotifyScreen.dart';
import 'screens/bottom_nav_bar/UserProfile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': const NotificationScreen(),
        'title': 'History',
      },
      {
        'page':  HomeScreen(),
        'title': 'Home',
      },
      {
        'page': const UserProfile(),
        'title': 'Profile',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[_selectedPageIndex]['page'] as Widget,
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _selectPage,
        backgroundColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.datBlue,
        currentIndex: _selectedPageIndex,
        selectedLabelStyle: const TextStyle(color: AppColors.datBlue),
        unselectedLabelStyle: const TextStyle(color: AppColors.black),
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/list.clipboard.fill.svg"),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 35,
                child: SvgPicture.asset("assets/home_icon_blue.svg")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Profile',
          ),
        ],
      ),
    );
  }
}
