import 'package:application_websocket/example_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = context.read<ColorBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, color) {
            return AnimatedContainer(
              height: 200,
              width: 200,
              color: color,
              duration: const Duration(seconds: 1),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(AmberColorEvent());
            },
            backgroundColor: Colors.amber,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.add(GreenColorEvent());
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
