import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/q_data.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/custom/custom_view_st_mark.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/custom/edit_delete.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/edit/edit_mark.dart';
import 'package:sirte_university/vars/size.dart';

getStudent() async {
  var response = await crud
      .postRequest(linkViewteMark, {"id": sharedPref.getString("id")});

  return response;
}

class ViewMark extends StatefulWidget {
  const ViewMark({super.key});

  @override
  State<ViewMark> createState() => _ViewMarkState();
}

class _ViewMarkState extends State<ViewMark> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return SizedBox(
              height: SizeConfig.screenHeight! * 0.7,
              child: ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.infoReverse,
                                  animType: AnimType.rightSlide,
                                  title: 'تعديل',
                                  desc: "هل تريد تعديل بيانات الطالب؟",
                                  btnOkOnPress: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => EditMark(
                                                  stData: snapshot.data['data']
                                                      [i],
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
                          ),
                          Expanded(
                            child: ViewStMark(
                              textNum: '${snapshot.data['data'][i]['num']}',
                              textMada: '${snapshot.data['data'][i]['m']}',
                              textAmly: '${snapshot.data['data'][i]['damly']}',
                              textNsfy: '${snapshot.data['data'][i]['dnsfy']}',
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
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
        });
  }
}
