import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/item_data_c.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/item_data_m.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/more_st.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

getStudent() async {
  var response = await crud.postRequest(linkViewStudent, {
    "pass": sharedPref.getString("pass"),
    "num": sharedPref.getString("num")
  });

  return response;
}

class PersonalScreenS extends StatefulWidget {
  const PersonalScreenS({
    super.key,
  });

  @override
  State<PersonalScreenS> createState() => _PersonalScreenState();
}

Crud crud = Crud();

class _PersonalScreenState extends State<PersonalScreenS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: FutureBuilder(
          future: getStudent(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['status'] == 'fail') {
                return const Center(
                    child: Text(
                  "لا يوجد بيانات",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ));
              }
              return PageView.builder(
                  itemCount: snapshot.data['data'].length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    sharedPref.setString(
                        "name", "${snapshot.data['data'][i]['name']}");
                    sharedPref.setString(
                        "mo", "${snapshot.data['data'][i]['mo']}");
                    sharedPref.setString(
                        "tq", "${snapshot.data['data'][i]['tq']}");
                    sharedPref.setString(
                        "college", "${snapshot.data['data'][i]['college']}");
                    sharedPref.setString(
                        "tkss", "${snapshot.data['data'][i]['tkss']}");
                    sharedPref.setString(
                        "time", "${snapshot.data['data'][i]['time']}");
                    return ListView(
                      children: [
                        Card(
                          elevation: 8,
                          color: colorwhite,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            sharedPref
                                                .getString("name")
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const Text(
                                            ':الأسم',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            sharedPref
                                                .getString("num")
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const Text(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ItemDataM(
                                    perText:
                                        "${sharedPref.getString("mo").toString()}%",
                                  ),
                                  ItemDataM(
                                    perText:
                                        sharedPref.getString("tq").toString(),
                                  ),
                                ],
                              ),
                              ItemDataC(
                                perTextC:
                                    "الكلية: ${sharedPref.getString("college").toString()}",
                                imagename: 'image/in/c1.png',
                              ),
                              ItemDataC(
                                perTextC:
                                    "التخصص: ${sharedPref.getString("tkss").toString()}",
                                imagename: "image/one/c1000.png",
                              ),
                              ItemDataC(
                                perTextC:
                                    "الفصل الدراسي: ${sharedPref.getString("time").toString()}",
                                imagename: "image/one/t.png",
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const QData()));
                                },
                                child: ItemQData(
                                  qText: 'النتائج النهائية',
                                  backCo: colorwhite,
                                  textCo: bgColor,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MoreSt()));
                                },
                                child: ItemQData(
                                  qText: 'المزيد من الخدمات',
                                  backCo: bgColor,
                                  textCo: colorwhite,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text(
                "Loading ...",
                style: TextStyle(color: colorwhite),
              ));
            }
            return MaterialButton(
                onPressed: () {
                  setState(() {});
                },
                child: Center(
                    child: Text(
                  "خطأ في الأتصال أنقر لاعادة المحاوله",
                  style: TextStyle(color: colorwhite),
                )));
          }),
    );
  }
}
