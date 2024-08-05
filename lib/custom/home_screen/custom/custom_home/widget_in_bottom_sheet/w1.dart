import 'package:flutter/material.dart';
import 'package:sirte_university/vars/text.dart';

class CustomW1 extends StatelessWidget {
  const CustomW1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      inAboutTheUniversity,
      style: const TextStyle(fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}
