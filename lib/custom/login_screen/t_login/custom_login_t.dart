import 'package:flutter/material.dart';
import 'package:sirte_university/custom/login_screen/t_login/button_fo_t.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/ConBorder.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/s_logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/text.dart';
import 'package:sirte_university/vars/color.dart';

class LoginForT extends StatefulWidget {
  const LoginForT({super.key});

  @override
  State<LoginForT> createState() => _LoginForTState();
}

class _LoginForTState extends State<LoginForT> {
  TextEditingController pass = TextEditingController();
  TextEditingController emil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                const ButtonFormT(
                  btf: 'دخول',
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
