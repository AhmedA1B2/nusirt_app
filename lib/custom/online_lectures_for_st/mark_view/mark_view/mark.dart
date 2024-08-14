import 'package:flutter/material.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/amthnat/q_data.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/custom/custom_view_st_mark.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

getStudent() async {
  var response = await crud
      .postRequest(linkViewStMark, {"num": sharedPref.getString("num")});

  return response;
}

class MarkView extends StatefulWidget {
  const MarkView({super.key});

  @override
  State<MarkView> createState() => _MarkViewState();
}

class _MarkViewState extends State<MarkView> {
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
