import 'package:flutter/material.dart';
import 'package:sirte_university/custom/online_lectures_for_st/mark_view/mark_view/mark.dart';
import 'package:sirte_university/custom/online_lectures_for_st/mark_view/search/search_mada.dart';
import 'package:sirte_university/vars/color.dart';

class ShowMark extends StatefulWidget {
  const ShowMark({super.key});

  @override
  State<ShowMark> createState() => _ShowMarkState();
}

class _ShowMarkState extends State<ShowMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: bgColor,
      body: ListView(
        children: const [
          SearchMada(),
          MarkView(),
        ],
      ),
    );
  }
}
