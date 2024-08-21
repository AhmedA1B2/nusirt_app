import 'package:flutter/material.dart';
import 'package:sirte_university/vars/text.dart';

class TextOpLog extends StatelessWidget {
  const TextOpLog({super.key, required this.color});

  final Color color;
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
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
