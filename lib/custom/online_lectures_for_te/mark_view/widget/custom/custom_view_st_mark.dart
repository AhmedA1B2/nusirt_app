import 'package:flutter/material.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/custom/texts_for_view.dart';
import 'package:sirte_university/vars/color.dart';

class ViewStMark extends StatelessWidget {
  const ViewStMark(
      {super.key,
      required this.textNum,
      required this.textMada,
      required this.textAmly,
      required this.textNsfy});

  final String textNum;
  final String textMada;
  final String textAmly;
  final String textNsfy;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Expanded(
            child: Table(
              border: TableBorder.all(color: bgColor),
              textDirection: TextDirection.rtl,
              children: [
                const TableRow(children: [
                  TextsForView(text: "رقم القيد"),
                  TextsForView(text: "الماده"),
                  TextsForView(text: "العملي"),
                  TextsForView(text: "النصفي"),
                ]),
                TableRow(children: [
                  TextsForView(text: textNum),
                  TextsForView(text: textMada),
                  TextsForView(text: textAmly),
                  TextsForView(text: textNsfy),
                ])
              ],
            ),
          )),
    );
  }
}
