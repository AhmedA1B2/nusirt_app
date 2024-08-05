import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

getStudent() async {
  var response = await crud.postRequest(linkExamStudent, {
    "pass": sharedPref.getString("pass"),
    "idnum": sharedPref.getString("num")
  });

  return response;
}

// ignore: camel_case_types
class sQData extends StatefulWidget {
  const sQData({
    Key? key,
  }) : super(key: key);

  @override
  State<sQData> createState() => _PersonalScreenState();
}

Crud crud = Crud();

class _PersonalScreenState extends State<sQData> {
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

              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, i) {
                    return Column(
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
    );
  }
}
