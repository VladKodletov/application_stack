import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SquareAnimation(),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const squareSize = 50.0;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: MyWidget(alignment: Alignment.topCenter),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("To the left")),
            ElevatedButton(
                onPressed: () => {}, child: const Text("To the right"))
          ],
        )
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  static const squareSize = 50.0;
  final right = Alignment.topRight;
  final left = Alignment.topLeft;
  final Alignment alignment;

  const MyWidget({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: alignment,
        children: [
          Container(
            width: squareSize,
            height: squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          )
        ],
      ),
    );
  }
}
