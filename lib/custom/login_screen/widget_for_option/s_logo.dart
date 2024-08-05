import 'package:flutter/material.dart';
import 'package:sirte_university/vars/size.dart';

class SmoleLogo extends StatelessWidget {
  const SmoleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.2,
      child: HeroMode(
        child: Hero(
          tag: "sirte",
          child: Image.asset(
            'image/home/Sirt.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
