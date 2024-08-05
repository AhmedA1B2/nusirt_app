import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class ItmeInMore extends StatelessWidget {
  const ItmeInMore(
      {super.key, required this.iconInItmeMore, required this.textInItmeMore});

  final IconData iconInItmeMore;
  final String textInItmeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 8,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                iconInItmeMore,
                color: colorwhite,
                size: 28,
              ),
              const Spacer(),
              Text(
                textInItmeMore,
                style: TextStyle(
                  color: colorwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
