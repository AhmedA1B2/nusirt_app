import 'package:flutter/material.dart';

class TextSizeW2A extends StatelessWidget {
  const TextSizeW2A({super.key, required this.suptitle});

  final String suptitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      suptitle,
      style: const TextStyle(fontSize: 18),
      textAlign: TextAlign.end,
    );
  }
}
