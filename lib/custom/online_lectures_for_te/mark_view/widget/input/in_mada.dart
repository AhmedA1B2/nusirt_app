import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class InMada extends StatefulWidget {
  const InMada({super.key});

  @override
  State<InMada> createState() => _InMadaState();
}

TextEditingController madaName = TextEditingController();

class _InMadaState extends State<InMada> {
  inMada() {
    if (madaName.text == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
    } else {
      sharedPref.setString("madaName", madaName.text);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: ':)',
        desc: "تم الادخال",
      ).show();
    }
  }

  isMadaNotEmpty() {
    if (sharedPref.getString("madaName").toString().isEmpty) {
      madaName.text = sharedPref.getString("madaName").toString();
    } else {
      madaName.text = "";
    }
  }

  @override
  void initState() {
    isMadaNotEmpty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                inMada();
              },
              icon: Icon(
                Icons.check_circle,
                color: colorwhite,
                size: 32,
              )),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.8,
            child: TextField(
              controller: madaName,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: colorwhite,
                  hintText: "رمز الماده",
                  hintStyle: TextStyle(
                    color: bgColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
