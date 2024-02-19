import 'package:bmi_calculator/service/colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {

 const AppContainer({
    super.key,
    this.components,
  });
 
  final Widget? components;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
      color: kActiveCardColour,
          borderRadius: BorderRadius.circular(12),
        ),
        child: components ?? const Icon(Icons.warning));
  }
}
