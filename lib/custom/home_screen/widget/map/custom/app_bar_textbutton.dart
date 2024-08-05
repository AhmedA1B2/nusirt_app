import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class AppBarTextButton extends StatelessWidget {
  const AppBarTextButton({super.key, required this.textAppBar});

  final String textAppBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textAppBar,
          style: TextStyle(color: colorwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
