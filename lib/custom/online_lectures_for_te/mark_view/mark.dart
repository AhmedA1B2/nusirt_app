import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/custom/custom_mark_card.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/input/in_mada.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/view/view_mark.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class Mark extends StatefulWidget {
  const Mark({super.key});

  @override
  State<Mark> createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: bgColor,
      body: Column(
        children: [
          const InMada(),
          MaterialButton(
              height: SizeConfig.screenHeight! * 0.1,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (sharedPref.getString("madaName").toString() == "" ||
                    sharedPref.getString("madaName").toString() == "null" ||
                    sharedPref.getString("madaName") == null) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.bottomSlide,
                    title: 'تنبيه',
                    desc: "عليك اولا ادخال رمز الماده في الاعلى ⇧ ا",
                  ).show();
                } else {
                  Navigator.of(context).pushNamed("inMark");
                }
              },
              child: const MarkCard()),
          const ViewMark()
        ],
      ),
    );
  }
}
