import 'package:flutter/material.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/check_internet/ui_nonit/no_nit.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/item_q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/q_data.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/item_data_c.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/more_st.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

getStudent() async {
  var response = await crud.postRequest(linkViewTeacher, {
    "pass": sharedPref.getString("pass"),
    "emil": sharedPref.getString("emil")
  });

  return response;
}

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
                        "college", "${snapshot.data['data'][i]['college']}");
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
                                                .getString("emil")
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const Text(
                                            ':البريد الالكتروني',
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
                              ItemDataC(
                                perTextC:
                                    "الكلية: ${sharedPref.getString("college").toString()}",
                                imagename: 'image/in/c1.png',
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
                child: const NoNit());
          }),
    );
  }
}
