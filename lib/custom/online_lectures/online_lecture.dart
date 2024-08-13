import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
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
              icon: Icons.play_for_work_rounded,
            ),
          ),
          ItemQData(
            qText: "رفع ملف pdf",
            backCo: colorwhite,
            textCo: bgColor,
            icon: Icons.picture_as_pdf,
          ),
          ItemQData(
            qText: "الواجبات",
            backCo: colorwhite,
            textCo: bgColor,
            icon: Icons.my_library_books_sharp,
          ),
          ItemQData(
            qText: "العملي",
            backCo: colorwhite,
            textCo: bgColor,
            icon: Icons.workspace_premium,
          ),
        ],
      ),
    );
  }
}
