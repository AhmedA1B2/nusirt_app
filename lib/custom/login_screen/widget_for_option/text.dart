import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/text.dart';

class TextOpLog extends StatelessWidget {
  const TextOpLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Text(
        signInOption,
        style: TextStyle(
          fontSize: 48,
          color: bgColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
