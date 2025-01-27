// lib/background.dart
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'lib/assets/bg.png', // Ensure the path is correct
          fit: BoxFit.cover,
        ),
        child, // This will hold the main content
      ],
    );
  }
}
