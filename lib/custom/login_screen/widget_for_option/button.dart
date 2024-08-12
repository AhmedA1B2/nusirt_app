import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class ButtonOpLog extends StatelessWidget {
  const ButtonOpLog({
    super.key,
    required this.butext,
  });

  final String butext;

  @override
  Widget build(BuildContext context) {
    return Text(
      butext,
      style: TextStyle(
        color: colorwhite,
        fontSize: 24,
      ),
    );
  }
}
