import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartyyy/model/res/constant/app_assets.dart';
import 'package:smartyyy/model/res/constant/app_icons.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

import '../../provider/bottomNavigation/bottom_navigation.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E), // Dark background color
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              image: AppIcons.dashboardicon,
              label: 'Dashboard',
              index: 0,
              isSelected: bottomNavProvider.selectedIndex == 0,
              context: context,
            ),
            _buildNavItem(
              image: AppIcons.listOfRoom_icon,              label: 'List of Rooms',
              index: 1,
              isSelected: bottomNavProvider.selectedIndex == 1,
              context: context,
            ),
            _buildNavItem(
              image: AppIcons.roomNotice,              label: 'Room Notice',
              index: 2,
              isSelected: bottomNavProvider.selectedIndex == 2,
              context: context,
            ),
            _buildNavItem(
              image: AppIcons.lastIcon,              label: '',
              index: 3,
              isSelected: bottomNavProvider.selectedIndex == 3,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String image,
    required String label,
    required int index,
    required bool isSelected,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Provider.of<BottomNavProvider>(context, listen: false).selectTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFB082F7) : Colors.transparent, // Purple background if selected
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 25,
              width: 25,
              color: isSelected ? Colors.black : Colors.white, // Black icon color if selected
            ),
            if (isSelected) ...[
              SizedBox(width: 8.0),
              AppTextWidget(text:
                label,
                  color: Colors.black, // Black text color if selected
                  fontWeight: FontWeight.w400,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
