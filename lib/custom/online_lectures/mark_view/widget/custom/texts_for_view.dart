import 'package:flutter/material.dart';

class TextsForView extends StatelessWidget {
  const TextsForView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
