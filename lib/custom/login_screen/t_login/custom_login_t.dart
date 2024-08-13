import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/check_internet/lodign/loding.dart';
import 'package:sirte_university/custom/login_screen/t_login/button_fo_t.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/ConBorder.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/s_logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/text.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

class LoginForT extends StatefulWidget {
  const LoginForT({super.key});

  @override
  State<LoginForT> createState() => _LoginForTState();
}

class _LoginForTState extends State<LoginForT> {
  TextEditingController pass = TextEditingController();
  TextEditingController emil = TextEditingController();

  Crud crud = Crud();
  bool isLoding = false;

  login() async {
    if (emil.text == "" || pass.text == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
      setState(() {});
    } else {
      isLoding = true;
      setState(() {});
      var response = await crud
          .postRequest(linkLoginTe, {"emil": emil.text, "pass": pass.text});
      isLoding = false;
      setState(() {});
      if (response['status'] == "success") {
        sharedPref.setString("pass", response['data']['pass'].toString());
        sharedPref.setString("emil", response['data']['emil'].toString());
        sharedPref.setString("id", response['data']['id_te'].toString());
        sharedPref.setString("tlogin", "1");
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil("homet", (route) => false);
      } else {
        // ignore: use_build_context_synchronously
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: isLoding == true
          ? const Loding()
          : ListView(
              children: [
                const SmoleLogo(),
                ConBorder(
                  inConB: Column(
                    children: [
                      const TextOpLog(),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                          hintText: "البريد الالكتروني",
                          con: emil,
                          fillColor: bgColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                          hintText: "كلمة المرور",
                          con: pass,
                          fillColor: bgColor,
                        ),
                      ),
                      const Spacer(),
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          login();
                        },
                        child: const ButtonFormT(
                          btf: 'دخول',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
