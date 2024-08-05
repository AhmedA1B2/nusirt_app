import 'package:flutter/material.dart';
import 'package:sirte_university/vars/shadow/image_shadow.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 100,
        right: 100,
        bottom: 40,
      ),
      child: ImgShadow(
        img: 'image/home/Sirt.png',
      ),
    );
  }
}
