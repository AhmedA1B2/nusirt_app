import 'package:flutter/material.dart';

class CustomW5 extends StatelessWidget {
  const CustomW5({super.key, required this.nameimgw});
  final String nameimgw;
  @override
  Widget build(BuildContext context) {
    return Image.asset(nameimgw);
  }
}
