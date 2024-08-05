import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/item_data_c.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/item_data_m.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/message.dart';

class PersonalScreenT extends StatefulWidget {
  const PersonalScreenT({
    super.key,
  });

  @override
  State<PersonalScreenT> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreenT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          Card(
            elevation: 8,
            color: colorwhite,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "محمد علي محمد علي ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              ':الأسم',
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "123456789",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              ':رقم القيد',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        shadows: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 0.1,
                            blurRadius: 7,
                            offset: Offset(1, 3),
                          ),
                        ],
                        Icons.person,
                        size: 80,
                        color: bgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: bgColor,
            borderOnForeground: true,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemDataM(perText: "القسم العلمي"),
                    ItemDataM(perText: "التخصص العلمي"),
                  ],
                ),
                const ItemDataC(
                  perTextC: "الرقم الوظيفي: 80908090",
                  imagename: 'image/one/c1000.png',
                ),
                const ItemDataC(
                  perTextC: "الكلية: تقنية المعلومات",
                  imagename: 'image/in/c1.png',
                ),
                const ItemDataC(
                  perTextC: "المؤهل العلمي:دكتوراه",
                  imagename: "image/in/c1.png",
                ),
                const ItemDataC(
                  perTextC: "الدرجة العلمية: أستاذ",
                  imagename: "image/one/t.png",
                ),
                MaterialButton(
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
                    child: ItemQData(
                      qText: 'المزيد',
                      backCo: bgColor,
                      textCo: colorwhite,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
