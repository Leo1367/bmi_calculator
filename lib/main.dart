import 'package:bmi_calculator/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IMCAplication());
}

class IMCAplication extends StatelessWidget {
  const IMCAplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}
