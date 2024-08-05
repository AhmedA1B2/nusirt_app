import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/button_out_form.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/shadow/container_shadow.dart';
import 'package:sirte_university/vars/size.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //
  TextEditingController nums = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Crud crud = Crud();
  bool isLoding = false;

  login() async {
    if (nums.text == "" || pass.text == "") {
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
          .postRequest(linkLogin, {"num": nums.text, "pass": pass.text});
      isLoding = false;
      setState(() {});
      if (response['status'] == "success") {
        sharedPref.setString("pass", response['data']['pass'].toString());
        sharedPref.setString("num", response['data']['num'].toString());
        sharedPref.setString("id", response['data']['id_st'].toString());
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil("homes", (route) => false);
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
    SizeConfig().init(context);
    return Scaffold(
      body: isLoding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                const HeroMode(
                  child: Hero(
                    tag: "sirte",
                    child: LogoLogin(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formState,
                    child: ConShadow(
                      con: Container(
                        width: SizeConfig.defaultSize! * 35,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'تسجيل الدخول',
                                style:
                                    TextStyle(color: colorwhite, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomTextFormField(
                                hintText: 'رقم القيد',
                                con: nums,
                                fillColor: colorbody,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomTextFormField(
                                hintText: 'كلمة المرور',
                                con: pass,
                                fillColor: colorbody,
                              ),
                            ),
                            MaterialButton(
                              color: bgColor,
                              elevation: 8,
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                'دخول',
                                style: TextStyle(
                                    color: colorwhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const ButtonOutForm(
                  btf: 'زائر',
                ),
              ],
            ),
    );
  }
}
