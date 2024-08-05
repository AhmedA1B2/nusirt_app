import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/shadow/container2_shdow.dart';

class ShatScreen extends StatefulWidget {
  const ShatScreen({super.key});

  @override
  State<ShatScreen> createState() => _ShatScreenState();
}

class _ShatScreenState extends State<ShatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                  color: colorwhite,
                ),
                ConShadow2(
                  con: Container(
                      decoration: BoxDecoration(
                          color: colorwhite,
                          borderRadius: BorderRadius.circular(22)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'مرحبا بك في تطبيقنا',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
