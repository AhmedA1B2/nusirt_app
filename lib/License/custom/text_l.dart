import 'package:flutter/material.dart';

class TextLic extends StatelessWidget {
  const TextLic({super.key, required this.text, required this.size});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style:  TextStyle(fontSize: size),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
