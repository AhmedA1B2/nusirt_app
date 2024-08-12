import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin_t/mark_view/widget/custom_mark_card.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin_t/mark_view/widget/custom_view_st_mark.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin_t/mark_view/widget/input/in_mada.dart';
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
      body: ListView(
        children: [
          const InMada(),
          MaterialButton(
              height: SizeConfig.screenHeight! * 0.1,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (sharedPref.getString("madaName").toString() == "" ||
                    sharedPref.getString("madaName").toString() == "null") {
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
          SizedBox(
            height: SizeConfig.screenHeight! * 0.5,
            child: ListView(
              children: const [
                ViewStMark(
                  textNum: '12',
                  textMada: 'ev1',
                  textAmly: '123',
                  textNsfy: '123',
                ),
                ViewStMark(
                  textNum: '1234',
                  textMada: 'gG',
                  textAmly: '19',
                  textNsfy: '28',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
