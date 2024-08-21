import 'package:flutter/material.dart';
import 'package:sirte_university/License/license.dart';
import 'package:sirte_university/custom/home_screen/app_home.dart';
import 'package:sirte_university/custom/login_screen/s_login/custom_login.dart';
import 'package:sirte_university/custom/login_screen/t_login/custom_login_t.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/ConBorder.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/button.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/s_logo.dart';
import 'package:sirte_university/custom/login_screen/widget_for_option/text.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';
import 'package:sirte_university/vars/text.dart';

class OptionToLogin extends StatefulWidget {
  const OptionToLogin({super.key});

  @override
  State<OptionToLogin> createState() => _OptionToLoginState();
}

double w = 300;
double h = 300;
double r = 1000;

onPr() {
  if (r == 1000) {
    w = 1000;
    h = 1000;
    r = 0.0;
  } else if (r == 0.0) {
    w = 0.0;
    h = 0.0;
    r = 1000;
  }
}

class _OptionToLoginState extends State<OptionToLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(r),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(r),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Spacer(),
              // s img

              const SmoleLogo(),

              // End  S IMG
              ConBorder(
                color: colorwhite,
                inConB: Column(
                  children: [
                    TextOpLog(
                      color: bgColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        color: bgColor,
                        minWidth: SizeConfig.screenWidth! * 0.6,
                        onPressed: () {
                          setState(() {
                            onPr();
                          });
                          ////////////////////////////////////////////////////
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginForm()));
                          });
                        },
                        child: ButtonOpLog(
                          butext: studentOption,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        color: bgColor,
                        minWidth: SizeConfig.screenWidth! * 0.6,
                        onPressed: () {
                          setState(() {
                            onPr();
                          });
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginForT()));
                          });
                        },
                        child: ButtonOpLog(
                          butext: employee,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        color: bgColor,
                        minWidth: SizeConfig.screenWidth! * 0.6,
                        onPressed: () {
                          setState(() {
                            onPr();
                          });
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          });
                        },
                        child: ButtonOpLog(
                          butext: guestOption,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const License(),
                        ));
                  },
                  child: Text(
                    "اتفاقية الترخيص",
                    style: TextStyle(color: colorbody),
                  )),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
