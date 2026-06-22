import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_nav.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/screens/home/widgets/all_tickets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        AppRoutes.homePage: (context) => const BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
      },
    );
  }
}
