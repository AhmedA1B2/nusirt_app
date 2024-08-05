import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/custom_webview_home.dart';
import 'package:sirte_university/vars/color.dart';

class CutomWeb extends StatelessWidget {
  const CutomWeb({
    super.key,
    required this.imghome,
    required this.texthome,
  });

  final String imghome;
  final String texthome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: MaterialButton(
        color: null,
        onPressed: () {
          Get.to(
            () => const WebViewHome(),
            transition: Transition.cupertinoDialog,
          );
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  imghome,
                  fit: BoxFit.contain,
                ),
                Text(
                  texthome,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
