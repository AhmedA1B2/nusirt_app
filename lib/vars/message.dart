import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "قريبا",
          style: TextStyle(fontSize: 18, color: bgColor),
        ),
        const Spacer(),
        Text(
          "ستتوفر الخدمة قريبا ان شاء الله",
          style: TextStyle(color: bgColor),
        ),
      ],
    );
  }
}
