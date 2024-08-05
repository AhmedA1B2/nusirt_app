import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/custom_bottom_sheet.dart';
import 'package:sirte_university/vars/color.dart';

class ItemHome extends StatelessWidget {
  const ItemHome(
      {super.key,
      required this.imghome,
      required this.texthome,
      required this.imagenamebottom,
      required this.textdatabottom,
      required this.chiledwidgetbottom});

  final String imghome;
  final String texthome;
  final String imagenamebottom;
  final String textdatabottom;
  final Widget chiledwidgetbottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: MaterialButton(
        color: null,
        onPressed: () {
          Get.bottomSheet(
              CustomBottomSheet(
                imgnamebottom: imagenamebottom,
                textBottom: textdatabottom,
                chiledwidget: chiledwidgetbottom,
              ),
              isScrollControlled: true,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(16)));
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
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
