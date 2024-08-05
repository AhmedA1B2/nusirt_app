import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/home_screen/app_home.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class ButtonOutForm extends StatelessWidget {
  const ButtonOutForm({super.key, required this.btf});

  final String btf;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextButton(
      onPressed: () {
        Get.to(
          () => const HomeScreen(),
          transition: Transition.cupertinoDialog,
        );
      },
      child: Container(
        height: SizeConfig.defaultSize! * 4,
        width: SizeConfig.defaultSize! * 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorwhite, width: 2),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            btf,
            style: TextStyle(
              color: colorwhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
