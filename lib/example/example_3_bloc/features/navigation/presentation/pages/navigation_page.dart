import 'package:application_websocket/example/example_3_bloc/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (_, state) =>
            state is NavigationPage1State ? const Page1() : const Page2(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NavigationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Page 2'),
          onPressed: () {
            bloc.add(NavigationPage2());
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NavigationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Page 1'),
          onPressed: () {
            bloc.add(NavigationPage1());
          },
        ),
      ),
    );
  }
}
