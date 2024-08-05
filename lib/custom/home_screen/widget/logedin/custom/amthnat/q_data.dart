import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/custom/text_table.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

getStudent() async {
  var response = await crud.postRequest(linkExamStudent, {
    "pass": sharedPref.getString("pass"),
    "idnum": sharedPref.getString("num")
  });

  return response;
}

class QData extends StatefulWidget {
  const QData({
    Key? key,
  }) : super(key: key);

  @override
  State<QData> createState() => _PersonalScreenState();
}

Crud crud = Crud();

class _PersonalScreenState extends State<QData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Card(
              elevation: 8,
              color: colorwhite,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                sharedPref.getString("name").toString(),
                                style: const TextStyle(fontSize: 18),
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
                                sharedPref.getString("num").toString(),
                                style: const TextStyle(fontSize: 18),
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
          ),
          Expanded(
            child: FutureBuilder(
                future: getStudent(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'fail') {
                      return const Center(
                          child: Text(
                        "لا يوجد بيانات",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ));
                    }

                    return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, i) {
                          sharedPref.setString(
                              "m1", "${snapshot.data['data'][i]['m1']}");
                          sharedPref.setString(
                              "m2", "${snapshot.data['data'][i]['m2']}");
                          sharedPref.setString(
                              "m3", "${snapshot.data['data'][i]['m3']}");
                          sharedPref.setString(
                              "m4", "${snapshot.data['data'][i]['m4']}");
                          sharedPref.setString(
                              "m5", "${snapshot.data['data'][i]['m5']}");
                          sharedPref.setString(
                              "m6", "${snapshot.data['data'][i]['m6']}");
                          sharedPref.setString(
                              "m7", "${snapshot.data['data'][i]['m7']}");
                          sharedPref.setString(
                              "m8", "${snapshot.data['data'][i]['m8']}");
                          sharedPref.setString(
                              "m9", "${snapshot.data['data'][i]['m9']}");
                          sharedPref.setString(
                              "m10", "${snapshot.data['data'][i]['m10']}");
                          sharedPref.setString(
                              "m11", "${snapshot.data['data'][i]['m11']}");
                          sharedPref.setString(
                              "m12", "${snapshot.data['data'][i]['m12']}");
                          ////////////////////////////////////////////////////////////////
                          sharedPref.setString(
                              "d1", "${snapshot.data['data'][i]['d1']}");
                          sharedPref.setString(
                              "d2", "${snapshot.data['data'][i]['d2']}");
                          sharedPref.setString(
                              "d3", "${snapshot.data['data'][i]['d3']}");
                          sharedPref.setString(
                              "d4", "${snapshot.data['data'][i]['d4']}");
                          sharedPref.setString(
                              "d5", "${snapshot.data['data'][i]['d5']}");
                          sharedPref.setString(
                              "d6", "${snapshot.data['data'][i]['d6']}");
                          sharedPref.setString(
                              "d7", "${snapshot.data['data'][i]['d7']}");
                          sharedPref.setString(
                              "d8", "${snapshot.data['data'][i]['d8']}");
                          sharedPref.setString(
                              "d9", "${snapshot.data['data'][i]['d9']}");
                          sharedPref.setString(
                              "d10", "${snapshot.data['data'][i]['d10']}");
                          sharedPref.setString(
                              "d11", "${snapshot.data['data'][i]['d11']}");
                          sharedPref.setString(
                              "d12", "${snapshot.data['data'][i]['d12']}");

                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          Text(
                                              "المعدل : ${snapshot.data['data'][i]['mof']}"),
                                          const Spacer(),
                                          Text(
                                              "الفصل الدراسي : ${snapshot.data['data'][i]['time']}"),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Table(
                                          textDirection: TextDirection.rtl,
                                          border: TableBorder.all(
                                              width: 1,
                                              color: Colors.black,
                                              style: BorderStyle.solid),
                                          children: [
                                            const TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                              children: [
                                                TextTable(
                                                  dataa: 'المادة',
                                                ),
                                                TextTable(
                                                  dataa: 'الدرجة',
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    sharedPref
                                                        .getString("m1")
                                                        .toString(),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    sharedPref
                                                        .getString("d1")
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m2")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d2")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m3")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d3")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m4")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d4")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m5")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d5")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m6")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d6")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m7")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d7")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m8")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d8")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m9")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d9")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m10")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d10")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m11")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d11")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("m12")
                                                      .toString(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  sharedPref
                                                      .getString("d12")
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Text(
                      "Loading ...",
                      style: TextStyle(color: colorbody),
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
          ),
        ],
      ),
    );
  }
}
