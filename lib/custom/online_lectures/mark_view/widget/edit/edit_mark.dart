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

class EditMark extends StatefulWidget {
  const EditMark({super.key, this.stData});
  final stData;
  @override
  State<EditMark> createState() => _EditMarkState();
}

TextEditingController conNum = TextEditingController();
TextEditingController conAmly = TextEditingController();
TextEditingController conNasfy = TextEditingController();
TextEditingController conmada = TextEditingController();

class _EditMarkState extends State<EditMark> {
  Crud crud = Crud();
  bool isLoding = false;

  editMark() async {
    if (conNum.text.isNotEmpty &&
            conAmly.text.isNotEmpty &&
            conmada.text.isNotEmpty ||
        conNum.text.isNotEmpty &&
            conNasfy.text.isNotEmpty &&
            conmada.text.isNotEmpty) {
      isLoding = true;
      setState(() {});
      var response = await crud.postRequest(linkEditMark, {
        "idnum": conNum.text,
        "m": conmada.text,
        "dnsfy": conNasfy.text,
        "damly": conAmly.text,
        "id": widget.stData['id'].toString(),
      });
      isLoding = false;
      setState(() {});
      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed('mark');
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
    }
  }

  @override
  void initState() {
    conNum.text = widget.stData["num"].toString();
    conAmly.text = widget.stData["damly"].toString();
    conNasfy.text = widget.stData["dnsfy"].toString();
    conmada.text = widget.stData["m"].toString();
    super.initState();
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
                    inputType: TextInputType.number,
                    fillColor: colorbody,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.8,
                    child: CustomTextFormField(
                        hintText: "أسم المادة",
                        con: conmada,
                        fillColor: colorbody),
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
                editMark();
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
