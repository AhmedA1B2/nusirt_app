import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin_t/mark_view/mark.dart';
import 'package:sirte_university/vars/color.dart';

class OnlineLecture extends StatelessWidget {
  const OnlineLecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: ListView(
        children: [
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.of(context).pushNamed("mark");
            },
            child: ItemQData(
              qText: "ادخال الدرجات",
              backCo: colorwhite,
              textCo: bgColor,
            ),
          ),
          ItemQData(
            qText: "رفع ملف pdf",
            backCo: colorwhite,
            textCo: bgColor,
          ),
          ItemQData(
            qText: "الواجبات",
            backCo: colorwhite,
            textCo: bgColor,
          ),
          ItemQData(
            qText: "العملي",
            backCo: colorwhite,
            textCo: bgColor,
          ),
        ],
      ),
    );
  }
}
