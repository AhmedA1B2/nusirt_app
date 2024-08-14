import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class CustomSnackBar2 extends StatelessWidget {
  const CustomSnackBar2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "سجل الدخول",
          style: TextStyle(fontSize: 18, color: bgColor),
        ),
        const Spacer(),
        Text(
          "يجب تسجيل الدخول اولا",
          style: TextStyle(color: bgColor),
        ),
      ],
    );
  }
}
