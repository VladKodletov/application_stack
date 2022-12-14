
import 'package:application_websocket/features/mainscreen/presentation/screen/mainscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const Scaffold(
          // under:examples 8.0 flutter_bloc
          // body: BlocScreen(),
          // body: BlocScreen2(),
          // body: SnackBarPage(),
          // body: NavigationPage(),
          body: MainScreen(),
        ));
  }
}
