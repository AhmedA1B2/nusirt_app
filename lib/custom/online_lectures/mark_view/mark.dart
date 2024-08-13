import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/q_data.dart';
import 'package:sirte_university/custom/online_lectures/mark_view/widget/custom/custom_mark_card.dart';
import 'package:sirte_university/custom/online_lectures/mark_view/widget/custom/custom_view_st_mark.dart';
import 'package:sirte_university/custom/online_lectures/mark_view/widget/custom/edit_delete.dart';
import 'package:sirte_university/custom/online_lectures/mark_view/widget/edit/edit_mark.dart';
import 'package:sirte_university/custom/online_lectures/mark_view/widget/input/in_mada.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

getStudent() async {
  var response = await crud
      .postRequest(linkViewteMark, {"id": sharedPref.getString("id")});

  return response;
}

class Mark extends StatefulWidget {
  const Mark({super.key});

  @override
  State<Mark> createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              return ListView(
                children: [
                  const InMada(),
                  MaterialButton(
                      height: SizeConfig.screenHeight! * 0.1,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        if (sharedPref.getString("madaName").toString() == "" ||
                            sharedPref.getString("madaName").toString() ==
                                "null" ||
                            sharedPref.getString("madaName") == null) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.bottomSlide,
                            title: 'تنبيه',
                            desc: "عليك اولا ادخال رمز الماده في الاعلى ⇧ ا",
                          ).show();
                        } else {
                          Navigator.of(context).pushNamed("inMark");
                        }
                      },
                      child: const MarkCard()),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.7,
                    child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, i) {
                          return Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      MaterialButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.infoReverse,
                                            animType: AnimType.rightSlide,
                                            title: 'تعديل',
                                            desc:
                                                "هل تريد تعديل بيانات الطالب؟",
                                            btnOkOnPress: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditMark(
                                                            stData:
                                                                snapshot.data[
                                                                    'data'][i],
                                                          )));
                                            },
                                            btnOkColor: bgColor,
                                          ).show();
                                        },
                                        child: EditDelete(
                                          icon: Icons.edit,
                                          color: bgColor,
                                        ),
                                      ),
                                      MaterialButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.scale,
                                            title: 'حذف',
                                            desc:
                                                "تحذير لن يتم الحذف بشكل كامل فقط سيتم حذفه من عندك",
                                            btnOkOnPress: () async {
                                              var response = await crud
                                                  .postRequest(linkDeleteMark, {
                                                "id": snapshot.data['data'][i]
                                                        ['id']
                                                    .toString()
                                              });
                                              if (response['status'] ==
                                                  "success") {
                                                setState(() {});
                                              }
                                            },
                                            btnOkColor: eroorColor,
                                          ).show();
                                        },
                                        child: EditDelete(
                                          icon: Icons.delete,
                                          color: eroorColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ViewStMark(
                                    textNum:
                                        '${snapshot.data['data'][i]['num']}',
                                    textMada:
                                        '${snapshot.data['data'][i]['m']}',
                                    textAmly:
                                        '${snapshot.data['data'][i]['damly']}',
                                    textNsfy:
                                        '${snapshot.data['data'][i]['dnsfy']}',
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
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
