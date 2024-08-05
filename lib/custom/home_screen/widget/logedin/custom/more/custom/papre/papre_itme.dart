import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/message.dart';

class PapreItme extends StatelessWidget {
  const PapreItme({super.key, required this.textPapreItme});

  final String textPapreItme;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.all(14),
              height: 90,
              decoration: BoxDecoration(
                color: colorbody,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const CustomSnackBar(),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      },
      child: Card(
        color: bgColor,
        child: Center(
          child: Text(
            textPapreItme,
            style: TextStyle(color: colorwhite, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
