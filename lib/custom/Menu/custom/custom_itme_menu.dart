import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class CustomItmeMenu extends StatelessWidget {
  const CustomItmeMenu({
    super.key,
    required this.textMeun,
    required this.iconMenu,
  });

  final String textMeun;
  final IconData iconMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, top: 2),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorwhite,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Icon(
                iconMenu,
                color: colorwhite,
                size: 24,
              ),
              const Spacer(),
              Text(
                textMeun,
                style: TextStyle(
                  color: colorwhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
