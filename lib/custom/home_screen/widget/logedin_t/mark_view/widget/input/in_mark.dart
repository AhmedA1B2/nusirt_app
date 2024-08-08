import 'package:flutter/material.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/button.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class InMark extends StatefulWidget {
  const InMark({super.key});

  @override
  State<InMark> createState() => _InMarkState();
}

TextEditingController conNum = TextEditingController();
TextEditingController conMada = TextEditingController();
TextEditingController conAmly = TextEditingController();
TextEditingController conNasfy = TextEditingController();

class _InMarkState extends State<InMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: bgColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          const LogoLogin(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.9,
                  child: CustomTextFormField(
                      hintText: "رقم القيد", con: conNum, fillColor: colorbody),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: CustomTextFormField(
                        hintText: "درجة العملي",
                        con: conMada,
                        fillColor: colorbody),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.9,
                  child: CustomTextFormField(
                    hintText: "درجة النصفي",
                    con: conAmly,
                    fillColor: colorbody,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MaterialButton(
              color: bgColor,
              minWidth: SizeConfig.screenWidth! * 0.6,
              onPressed: () {},
              child: const ButtonOpLog(
                butext: "ادخال",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
