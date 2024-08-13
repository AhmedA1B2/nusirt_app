import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class NoNit extends StatefulWidget {
  const NoNit({super.key});

  @override
  State<NoNit> createState() => _NoNitState();
}

class _NoNitState extends State<NoNit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Image.asset(
                "image/one/noWiFi.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "لا يوجد اتصال بالانترنت",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colorwhite,
              ),
            ),
            Text(
              "أنقر لاعادة المحاولة",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colorwhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
