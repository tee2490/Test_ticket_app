import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:ticket_app/controller/bottom_nav_controller.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  //dependency injection
  final BottomNavController controller = Get.put(BottomNavController());

  //list is iterated using index

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print("my tab val ${controller.selectedIndex.value}");
    return Obx(() {
      return Scaffold(
        body: appScreens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526400),
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.home_24_regular),
              activeIcon: Icon(FluentIcons.home_24_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.search_24_regular),
              activeIcon: Icon(FluentIcons.search_24_filled),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.ticket_diagonal_24_regular),
              activeIcon: Icon(FluentIcons.ticket_diagonal_24_filled),
              label: "Tickets",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.person_24_regular),
              activeIcon: Icon(FluentIcons.person_24_filled),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
