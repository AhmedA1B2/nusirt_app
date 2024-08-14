import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class SearchMada extends StatefulWidget {
  const SearchMada({super.key});

  @override
  State<SearchMada> createState() => _SearchMadaState();
}

class _SearchMadaState extends State<SearchMada> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check_circle,
                color: colorwhite,
                size: 32,
              )),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.8,
            child: TextField(
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: colorwhite,
                  hintText: "رمز أو أسم الماده",
                  hintStyle: TextStyle(
                    color: bgColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
