import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:application_websocket/example/example_3_bloc/snackBar_blocListener/presentation/bloc/snackbar_bloclistener_bloc.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBloc = context.read<SnackbarBloclistenerBloc>();
    return Scaffold(
      body: BlocListener<SnackbarBloclistenerBloc, SnackbarBloclistenerState>(
        listener: (context, state) {
          if (state is SnackbarBloclistenerSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<SnackbarBloclistenerBloc, SnackbarBloclistenerState>(
          builder: (context, state) {
            if (state is SnackbarBloclistenerInitial) {
              return const Center(child: Text('Press the Button'));
            }
            if (state is SnackbarBloclistenerLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SnackbarBloclistenerSuccess) {
              return const Center(child: Text('Success'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              dataBloc.add(FetchData());
            },
          ),
        ],
      ),
    );
  }
}
