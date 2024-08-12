import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/button.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class InMark extends StatefulWidget {
  const InMark({super.key});

  @override
  State<InMark> createState() => _InMarkState();
}

TextEditingController conNum = TextEditingController();
TextEditingController conAmly = TextEditingController();
TextEditingController conNasfy = TextEditingController();

class _InMarkState extends State<InMark> {
  Crud crud = Crud();
  bool isLoding = false;

  addMark() async {
    if (conNum.text == "" || conAmly.text == "" || conNasfy.text == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
    } else {
      isLoding = true;
      setState(() {});
      var response = await crud.postRequest(linkAddMark, {
        "idnum": conNum.text,
        "madaname": sharedPref.getString("madaName").toString(),
        "dnsfy": conNasfy.text,
        "damly": conAmly.text,
        "who_added": sharedPref.getString("id").toString(),
      });
      isLoding = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("mark", (route) => false);
      }
    }
  }

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
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.9,
                  child: CustomTextFormField(
                    hintText: "رقم القيد",
                    con: conNum,
                    fillColor: colorbody,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.8,
                    child: CustomTextFormField(
                        hintText: "درجة العملي",
                        con: conAmly,
                        inputType: TextInputType.number,
                        fillColor: colorbody),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.8,
                  child: CustomTextFormField(
                    hintText: "درجة النصفي",
                    con: conNasfy,
                    inputType: TextInputType.number,
                    fillColor: colorbody,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MaterialButton(
              height: 50,
              color: bgColor,
              minWidth: SizeConfig.screenWidth! * 0.6,
              onPressed: () {
                addMark();
              },
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
