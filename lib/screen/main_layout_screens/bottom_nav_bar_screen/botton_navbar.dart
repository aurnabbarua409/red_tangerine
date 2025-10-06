import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/chats_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/home_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/matches_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen/profile_screen.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MatchesScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.2, 0), // slide from right
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _pages[_selectedIndex],
        ),

        // Bottom Navbar using Container
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 63,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(AppIcons.homeIcon, 0),
              _buildNavItem(AppIcons.sproutIcon, 1),
              _buildNavItem(AppIcons.messageSqaureIcon, 2),
              _buildNavItem(AppIcons.profileIcon, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: IconWidget(
        icon: icon,
        color: isSelected ? AppColors.orange : AppColors.white_700,
      ),
    );
  }
}
