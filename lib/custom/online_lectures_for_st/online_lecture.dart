import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
import 'package:sirte_university/vars/color.dart';

class OnlineLectureSt extends StatelessWidget {
  const OnlineLectureSt({super.key});

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
              Navigator.of(context).pushNamed("showmark");
            },
            child: ItemQData(
              qText: "عرض الدرجات",
              backCo: colorwhite,
              textCo: bgColor,
              icon: Icons.view_stream,
            ),
          ),
          ItemQData(
            qText: "البحث عن شيت",
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
