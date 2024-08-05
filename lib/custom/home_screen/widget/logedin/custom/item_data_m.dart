import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class ItemDataM extends StatelessWidget {
  const ItemDataM({super.key, required this.perText});
  final String perText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: colorwhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0.1,
                  blurRadius: 5,
                  offset: Offset(1, 5),
                ),
              ],
            ),
            child: SizedBox(
              height: SizeConfig.screenHeight! * 0.18,
              width: SizeConfig.screenWidth! * 0.3,
              child: Center(
                child: Text(
                  textDirection: TextDirection.rtl,
                  perText,
                  style: TextStyle(fontSize: 36, color: bgColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
