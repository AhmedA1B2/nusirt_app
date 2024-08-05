import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/college_web/custom_webview_college_a_and_hrawa.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/college_web/custom_webview_college_a_and_s.dart';
import 'package:sirte_university/vars/text.dart';

// ignore: camel_case_types
class customW7 extends StatelessWidget {
  const customW7({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Get.to(
                () => const WebViewCollegeZ(),
                transition: Transition.leftToRight,
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'image/in/cc.jpg',
                  fit: BoxFit.contain,
                ),
                 Text(
                  zmzm,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              Get.to(
                () => const WebViewCollegeHraowa(),
                transition: Transition.leftToRight,
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'image/in/cc2.png',
                  fit: BoxFit.contain,
                ),
                 Text(
                  harawa,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
