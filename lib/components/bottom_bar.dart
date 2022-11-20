import 'package:application_websocket/screens/favorite_screen.dart';
import 'package:application_websocket/screens/mainscreen.dart';
import 'package:application_websocket/screens/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final screensNavigation = [
    const MainScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensNavigation[index],
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
            height: 50,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
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
                  Icons.format_indent_increase_outlined,
                ),
                selectedIcon: Icon(
                  Icons.search,
                  size: 32,
                ),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite,
                ),
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  size: 32,
                ),
                label: 'Favorites',
              ),
            ]),
      ),
    );
  }
}
