import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class TextSizeW2Q extends StatelessWidget {
  const TextSizeW2Q({
    super.key,
    required this.titleq,
  });

  final String titleq;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleq,
      style: TextStyle(fontSize: 22, color: bgColor),
      textAlign: TextAlign.center,
    );
  }
}
