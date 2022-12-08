import 'package:application_websocket/example_bloc/bloc.dart';
import 'package:application_websocket/example_bloc/bloc_screen.dart';
import 'package:application_websocket/features/mainscreen/presentation/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blueGrey),
          home: const Scaffold(
            // under:example 8.0 flutter_bloc
            // body: BlocScreen(),
            body: MainScreen(),
          )),
    );
  }
}
