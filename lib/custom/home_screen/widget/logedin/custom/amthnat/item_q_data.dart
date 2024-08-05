import 'package:flutter/material.dart';
import 'package:sirte_university/vars/size.dart';

class ItemQData extends StatelessWidget {
  const ItemQData(
      {super.key,
      required this.qText,
      required this.backCo,
      required this.textCo});
  final String qText;
  final Color backCo;
  final Color textCo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 8,
        color: backCo,
        child: SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
          width: SizeConfig.screenWidth! * 1,
          child: Center(
            child: Text(
              qText,
              style: TextStyle(fontSize: 36, color: textCo),
            ),
          ),
        ),
      ),
    );
  }
}
