import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/login_screen/s_login/custom_login.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/text.dart';

class NoneLogIn extends StatelessWidget {
  const NoneLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorwhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: eroorColor,
              size: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                erorrLog,
                style: TextStyle(
                  color: eroorColor,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(
                  () => const LoginForm(),
                  transition: Transition.cupertinoDialog,
                );
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    signInOption,
                    style: TextStyle(color: colorwhite, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
