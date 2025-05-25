import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibe_match/core/theme/app_colors.dart';
import 'package:vibe_match/presentation/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<String> _selectedIcons = [
    'assets/images/pocker_cards.svg',
    'assets/images/fire.svg',
    'assets/images/message.svg',
    'assets/images/person.svg',
  ];

  final List<String> _unselectedIcons = [
    'assets/images/pocker_cards.svg',
    'assets/images/fire.svg',
    'assets/images/message.svg',
    'assets/images/person.svg',
  ];

  final List<Widget> _pages = [HomePage(), HomePage(), HomePage(), HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black_5,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(4, (index) {
          Widget icon = SvgPicture.asset(
            _currentIndex == index
                ? _selectedIcons[index]
                : _unselectedIcons[index],
            width: 24,
            height: 24,
          );

          if (index == 1 || index == 2) {
            icon = badges.Badge(
              position: badges.BadgePosition.topEnd(top: 2, end: -6),
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColors.purple_5,
                shape: badges.BadgeShape.square,
                borderRadius: BorderRadius.circular(8),
                padding: EdgeInsets.zero,
              ),
              badgeContent: SizedBox(
                width: 12,
                height: 8,
                child: Text(
                  index == 1 ? "" : "10",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              child: icon,
            );
          }

          return BottomNavigationBarItem(icon: icon, label: '');
        }),
      ),
    );
  }
}
