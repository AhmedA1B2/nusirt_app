import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 28, color: colorwhite),
    );
  }
}
