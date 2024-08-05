import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w4/custom_item_w4.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_a.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_d.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_e.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_ec.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_ed.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_hm.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_it.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_webview/faculty_web/custom_webview_college_l.dart';
import 'package:sirte_university/vars/text.dart';

class CustomW4 extends StatelessWidget {
  const CustomW4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeIT(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: iT,
                namei: 'image/in/it.png',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeE(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: engineering,
                namei: 'image/in/c22.png',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeHM(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: hMedicine,
                namei: 'image/in/c3.png',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeD(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: dentistry,
                namei: 'image/in/c4.png',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeL(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: literature,
                namei: 'image/in/c5.png',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeA(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: agriculture,
                namei: 'image/in/c6.png',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeEc(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: economics,
                namei: 'image/in/c7.png',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.to(
                  () => const WebViewCollegeEd(),
                  transition: Transition.leftToRight,
                );
              },
              child: CuItW4(
                namec: education,
                namei: 'image/in/c8.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
