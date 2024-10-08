import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/check_internet/lodign/loding.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/text.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController support = TextEditingController();

  Crud crud = Crud();
  bool isLoding = false;

  send() async {
    if ("${sharedPref.getString("num")}" == "null" ||
        "${sharedPref.getString("num")}" == "Null" ||
        sharedPref.getString("num").toString().isEmpty ||
        "${sharedPref.getString("num")}" == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'info',
        desc: 'يجب تسجيل الدخول اولا',
      ).show();
      setState(() {});
    } else {
      if (support.text == "") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'info',
          desc: 'لا يمكنك ترك حقل فارغ',
        ).show();
        setState(() {});
      } else {
        isLoding = true;
        setState(() {});
        var response = await crud.postRequest(linkSuport, {
          "name": sharedPref.getString("name").toString(),
          "num": sharedPref.getString("num").toString(),
          "mesag": support.text
        });
        isLoding = false;
        setState(() {});
        if (response['status'] == "success") {
          support.text = "";
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'شكرا',
            desc: 'شكرا لملاحظتك أنت تساعدنا حقا في تحسين التجربة للمستخدم',
          ).show();
        } else {
          AwesomeDialog(
            // ignore: use_build_context_synchronously
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: ':[',
            desc: "هناك خطاء في ادخال البيانات",
          ).show();
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorwhite,
      body: isLoding == true
          ? const Loding()
          : Center(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(120)),
                    ),
                    child: const LogoLogin(),
                  ),
                  Card(
                    color: colorwhite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              mysupport,
                              style: TextStyle(
                                  color: bgColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  shadows: const [
                                    Shadow(
                                        color: Colors.black26,
                                        offset: Offset(2, 2))
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextFormField(
                              hintText: "أكتب مشكلتك هنا",
                              con: support,
                              fillColor: bgColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              send();
                            },
                            child: Card(
                                color: colorwhite,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "ارسال",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: bgColor),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "أكتب أي مشكلة أو أي شيء تريد أن نعدله في التطبيق للعلم سيكون لدينا وصول لأسمك و رقم قيدك لتجنب أي تجاوزات",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
