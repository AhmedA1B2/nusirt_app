import 'package:flutter/material.dart';

class LogoInAppBar extends StatelessWidget {
  const LogoInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      child: Hero(
        tag: "sirte",
        child: Image.asset(
          'image/home/Sirt.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
