import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/shadow/container2_shdow.dart';
import 'package:sirte_university/vars/size.dart';

class CuItW4 extends StatelessWidget {
  const CuItW4({super.key, required this.namec, required this.namei});

  final String namei;
  final String namec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConShadow2(
          con: Container(
              width: SizeConfig.screenWidth! * 0.36,
              decoration: BoxDecoration(
                  color: colorwhite, borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                namei,
                fit: BoxFit.contain,
              )),
        ),
        Text(
          namec,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
