import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_nashtat/item_it_day.dart';
import 'package:sirte_university/vars/text.dart';

class ArabDay extends StatelessWidget {
  const ArabDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemITDay(
      textData:
          arbDay,
      imgData: Image.asset(
        "image/in/ad1812.jpeg",
        fit: BoxFit.contain,
      ),
    );
  }
}
