import 'package:flutter/material.dart';

import 'package:application_websocket/screens/favorite_screen.dart';
import 'package:application_websocket/screens/mainscreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int value = 0;
  final screensNavigation = [
    const MainScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensNavigation[value],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: Colors.blueGrey.shade200,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        child: NavigationBar(
            height: 60,
            selectedIndex: value,
            onDestinationSelected: (index) =>
                (index) => setState(() => value = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                ),
                selectedIcon: Icon(Icons.home, size: 32),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite_border,
                ),
                selectedIcon: Icon(
                  Icons.favorite,
                  size: 32,
                ),
                label: 'Favorites',
              ),
            ]),
      ),
    );
  }
}
