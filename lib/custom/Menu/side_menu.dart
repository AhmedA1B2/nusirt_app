import 'package:flutter/material.dart';
import 'package:sirte_university/custom/Menu/custom/custom_itme_menu.dart';
import 'package:sirte_university/custom/Menu/custom/translation.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/message.dart';
import 'package:sirte_university/vars/message2.dart';
import 'package:sirte_university/vars/size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirte_university/vars/text.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

double? teme = 0.0;
Future memoris() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final double decimal = prefs.getDouble('teme')!;
  teme = decimal;
}

class _SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    memoris();
    super.initState();
  }

  logout() {
    if (sharedPref.getString("pass") != null) {
      return MaterialButton(
        color: colorwhite,
        onPressed: () async {
          sharedPref.clear();
          Navigator.of(context).pushReplacementNamed('op');
        },
        child: Text(
          'تسجيل الخروج',
          style: TextStyle(color: bgColor),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
              tween: Tween(
                begin: 300.0,
                end: 0.0,
              ),
              duration: const Duration(milliseconds: 600),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      border: Border(
                        left: BorderSide(
                          color: colorwhite,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    width: SizeConfig.screenWidth! * 0.7,
                    height: double.infinity,
                    child: Column(
                      children: [
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            if (sharedPref.getString("tlogin").toString() ==
                                "1") {
                              Navigator.of(context).pushNamed("lecture");
                            } else if (sharedPref
                                    .getString("slogin")
                                    .toString() ==
                                "1") {
                              Navigator.of(context).pushNamed("lectures");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Container(
                                    padding: const EdgeInsets.all(14),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: colorbody,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const CustomSnackBar2(),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                            }
                          },
                          child: CustomItmeMenu(
                            textMeun: onlineLectures,
                            iconMenu: Icons.cloud_sharp,
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Container(
                                  padding: const EdgeInsets.all(14),
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: colorbody,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const CustomSnackBar(),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          },
                          child: CustomItmeMenu(
                            textMeun: ai,
                            iconMenu: Icons.smart_button_sharp,
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).pushNamed("support");
                          },
                          child: CustomItmeMenu(
                            textMeun: mysupport,
                            iconMenu: Icons.support_agent_outlined,
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () async {
                            setState(() {
                              if (teme == 0.0) {
                                bgColor = Colors.black;
                                colorbody = Colors.grey;
                                teme = 1.0;
                              } else if (teme == 1.0) {
                                bgColor = const Color.fromARGB(255, 8, 91, 11);
                                colorbody = Colors.lightGreen;
                                teme = 2.0;
                              } else if (teme == 2.0) {
                                bgColor = Colors.amber;
                                colorbody =
                                    const Color.fromARGB(255, 246, 255, 0);
                                teme = 3.0;
                              } else if (teme == 3.0) {
                                bgColor = const Color(0xff093395);
                                colorbody = const Color(0xff75C5EF);
                                teme = 0.0;
                              }
                            });
                            memoristeme() async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setDouble('teme', teme!);
                            }

                            setState(() {
                              memoristeme();
                            });
                          },
                          child: CustomItmeMenu(
                            textMeun: theme,
                            iconMenu: Icons.color_lens,
                          ),
                        ),
                        const Translation(),
                        logout(),
                        const Spacer(),
                        Text(
                          "جامعة سرت | الحقوق محفوظة © ${DateTime.now().year}",
                          style: TextStyle(color: colorwhite, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
