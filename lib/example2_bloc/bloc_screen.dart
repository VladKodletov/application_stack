// import 'package:application_websocket/example_bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocScreen2 extends StatelessWidget {
//   const BlocScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(),
//     );
//   }
// }

// Stream<int> exampleStream(int max) async* {
//   for (int i = 0; i < max; i++) {
//     yield i;
//   }
// }

// Future<int> sumStream(Stream<int> stream) async {
//   int sum = 0;
//   await for (int value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// import 'package:application_websocket/example2_bloc/bloc.dart';

// Future<void> main() async {
  // final bloc = CounterBloc();
  // //stream usage
  // final subscription = bloc.stream.listen(print);

  // bloc.add(CounterIncrement());
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();
  // await bloc.close();
  // CounterBloc()
  //   ..add(CounterIncrement())
  //   ..close();
//basic usage
  // print(bloc.state);
  // bloc.add(CounterIncrement());
  // await Future.delayed(Duration(seconds: 2));
  // print(bloc.state);
  // await bloc.close();
// }
