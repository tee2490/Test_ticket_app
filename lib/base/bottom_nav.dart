import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/bloc/bottom_nav_bloc.dart';
import 'package:ticket_app/bloc/bottom_nav_events.dart';
import 'package:ticket_app/bloc/bottom_nav_states.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  //list is iterated using index

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        print("my state is $state");

        if (state is BottomNavBarSelected) {
          return Scaffold(
            body: appScreens[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (int index) {
                context.read<BottomNavBloc>().add(OnItemTapped(index));
              },
              //onTap: ref.watch(bottomNavBarNotifierProvider.notifier).onItemTapped,
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
        } else {
          return Container();
        }
      },
    );
  }
}
