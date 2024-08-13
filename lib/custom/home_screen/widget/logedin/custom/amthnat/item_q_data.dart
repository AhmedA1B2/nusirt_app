import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class ItemQData extends StatelessWidget {
  const ItemQData(
      {super.key,
      required this.qText,
      required this.backCo,
      required this.textCo,
      this.icon});
  final String qText;
  final Color backCo;
  final Color textCo;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 8,
        color: backCo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
            width: SizeConfig.screenWidth! * 1,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    qText,
                    style: TextStyle(fontSize: 36, color: textCo),
                  ),
                ),
                Icon(
                  icon,
                  size: 32,
                  color: bgColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
