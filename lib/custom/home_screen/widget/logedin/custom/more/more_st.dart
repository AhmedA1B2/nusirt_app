import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/itme_in_more.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/app_bar_text.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/library.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/page_in_more_papre.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/message.dart';

class MoreSt extends StatefulWidget {
  const MoreSt({super.key});

  @override
  State<MoreSt> createState() => _MoreStState();
}

class _MoreStState extends State<MoreSt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: colorwhite,
        actions: [
          IconButton(
              onPressed: () {
                if (sharedPref.getString("tlogin").toString() == "1") {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    'homet',
                    (route) => false,
                  );
                } else if (sharedPref.getString("slogin").toString() == "1") {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    'homes',
                    (route) => false,
                  );
                }
              },
              icon: const Icon(Icons.arrow_back)),
          const Spacer(),
          const AppBarText(title: "الخدمات"),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: bgColor,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              if (sharedPref.getString("tlogin").toString() == "1") {
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
              } else if (sharedPref.getString("slogin").toString() == "1") {
                Get.to(
                  () => const PageInMorePapre(),
                  transition: Transition.fade,
                );
              }
            },
            child: const ItmeInMore(
              iconInItmeMore: Icons.my_library_books,
              textInItmeMore: "الخدمات الورقيه",
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Get.to(
                () => const Library(),
                transition: Transition.fade,
              );
            },
            child: const ItmeInMore(
              iconInItmeMore: Icons.local_library,
              textInItmeMore: "خدمات المكتبة",
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
            child: const ItmeInMore(
              iconInItmeMore: Icons.attach_money,
              textInItmeMore: "الخدمات المالية",
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
            child: const ItmeInMore(
              iconInItmeMore: Icons.home_work,
              textInItmeMore: "السكن الداخلي",
            ),
          ),
        ],
      ),
    );
  }
}
