import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:smartyyy/model/res/constant/app_colors.dart';

import '../../model/provider/bottomNavigation/bottom_navigation.dart';
import '../../model/res/widgets/customNav.dart';
import '../ListOfRooms/ListOfRooms.dart';
import '../RoomNotice/RoomNotice.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  final List<Widget> _screens = [
    DashboardScreen(),
    ListOfRooms(),
    RoomNotice(),
    DashboardScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[bottomNavProvider.selectedIndex], // Display the selected screen
      bottomNavigationBar:CustomBottomNavigationBar(),
    );
  }
}
