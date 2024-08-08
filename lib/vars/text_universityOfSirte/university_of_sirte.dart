import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/text.dart';

class UniversityOfSirte extends StatelessWidget {
  const UniversityOfSirte({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      universityOfSirte,
      style: TextStyle(
          color: colorwhite, fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}
