import 'package:flutter/material.dart';
import 'package:dice_game/gradient.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 26, 0, 0),
            Color.fromARGB(255, 45, 7, 98)
          ],
        ),
      ),
    ),
  );
}
