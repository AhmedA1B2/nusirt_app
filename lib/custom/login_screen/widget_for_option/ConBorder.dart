// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class ConBorder extends StatelessWidget {
  const ConBorder({super.key, required this.inConB});

  final Widget inConB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.05, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: colorwhite,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 2)),
        height: SizeConfig.screenHeight! * 0.65,
        width: SizeConfig.screenWidth! * 1,
        child: inConB,
      ),
    );
  }
}
