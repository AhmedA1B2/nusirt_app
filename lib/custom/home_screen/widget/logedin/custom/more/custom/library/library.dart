import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/app_bar_text.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_cancel_Itme.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_eidt.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_input.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_itme.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_line.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/libary_wit_Itme.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

getreqste() async {
  var response =
      await crud.postRequest(linkviewhgz, {"id": sharedPref.getString("id")});

  return response;
}

getcancel() async {
  var response = await crud
      .postRequest(linkviewcancelhgz, {"id": sharedPref.getString("id")});

  return response;
}

getstart() async {
  var response = await crud
      .postRequest(linkviewstarthgz, {"id": sharedPref.getString("id")});

  return response;
}

Crud crud = Crud();

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: colorwhite,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  'MoreSt',
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          const Spacer(),
          const AppBarText(title: "خدمات المكتبة"),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const LibaryLine(
                textLine: 'الكتب المحجوزة',
              ),
              FutureBuilder(
                  future: getstart(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'fail') {
                        return const Center(
                            child: Text(
                          "لا يوجد كتب محجوزة",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ));
                      }

                      return ListView.builder(
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return LibaryItme(
                              endDete:
                                  "ينتهي بعد ثلاثه ايام من تاريخ :${snapshot.data['data'][i]['date']}",
                              bookNmae: "${snapshot.data['data'][i]['book']}",
                              onPressedDelete: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.menu_book_sharp,
                                  color: bgColor,
                                ),
                              ),
                            );
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Text(
                        "Loading ...",
                      ));
                    }
                    return MaterialButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Center(
                            child: Text(
                          "خطأ في الأتصال أنقر لاعادة المحاوله",
                        )));
                  }),
              const LibaryLine(
                textLine: 'لم يتم القبول',
              ),
              FutureBuilder(
                  future: getcancel(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'fail') {
                        return const Center(
                            child: Text(
                          "لم يتم رفض اي حجز",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ));
                      }

                      return ListView.builder(
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return LibaryCancelItme(
                              cancel:
                                  "${snapshot.data['data'][i]['why_cancel']}",
                              delete: IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.scale,
                                    title: 'حذف',
                                    desc: "هل تريد حذف الكتاب؟",
                                    btnOkOnPress: () async {
                                      var response = await crud.postRequest(
                                          linkdeletecancelhgz, {
                                        "id": snapshot.data['data'][i]['id']
                                            .toString()
                                      });
                                      if (response['status'] == "success") {
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushReplacementNamed('libary');
                                      }
                                    },
                                    btnOkColor: Colors.red,
                                  ).show();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              bookNmae: "${snapshot.data['data'][i]['book']}",
                            );
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Text(
                        "Loading ...",
                      ));
                    }
                    return MaterialButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Center(
                            child: Text(
                          "خطأ في الأتصال أنقر لاعادة المحاوله",
                        )));
                  }),

              //
              const LibaryLine(
                textLine: 'في الأنتظار',
              ),
              FutureBuilder(
                  future: getreqste(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'fail') {
                        return const Center(
                            child: Text(
                          "لم يتم حجز أي كتاب",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ));
                      }

                      return ListView.builder(
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return LibaryWitItme(
                              eidt: IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.infoReverse,
                                    animType: AnimType.rightSlide,
                                    title: 'تعديل',
                                    desc: "هل تريد تعديل أسم الكتاب؟",
                                    btnOkOnPress: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => LibaryEidt(
                                                    stData: snapshot
                                                        .data['data'][i],
                                                  )));
                                    },
                                    btnOkColor: bgColor,
                                  ).show();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              delete: IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.scale,
                                    title: 'حذف',
                                    desc: "هل تريد حذف الكتاب؟",
                                    btnOkOnPress: () async {
                                      var response = await crud.postRequest(
                                          linkdeletehgz, {
                                        "id": snapshot.data['data'][i]['id']
                                            .toString()
                                      });
                                      if (response['status'] == "success") {
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushReplacementNamed('libary');
                                      }
                                    },
                                    btnOkColor: Colors.red,
                                  ).show();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              bookNmae: "${snapshot.data['data'][i]['book']}",
                            );
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Text(
                        "Loading ...",
                      ));
                    }
                    return MaterialButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Center(
                            child: Text(
                          "خطأ في الأتصال أنقر لاعادة المحاوله",
                        )));
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                heightFactor: 2,
                child: FloatingActionButton(
                  backgroundColor: bgColor,
                  onPressed: () {
                    Get.bottomSheet(const LibaryInput(),
                        isScrollControlled: true,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(16)));
                  },
                  child: Text(
                    "حجز",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colorbody),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
