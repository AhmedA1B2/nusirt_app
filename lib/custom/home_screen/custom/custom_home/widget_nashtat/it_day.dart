import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_nashtat/item_it_day.dart';
import 'package:sirte_university/vars/text.dart';

class TiDay extends StatelessWidget {
  const TiDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemITDay(
      textData: itDay,
      imgData: Image.asset(
        "image/in/it61.jpeg",
        fit: BoxFit.contain,
      ),
    );
  }
}
