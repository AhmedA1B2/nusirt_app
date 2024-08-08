import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class InMada extends StatefulWidget {
  const InMada({super.key});

  @override
  State<InMada> createState() => _InMadaState();
}

class _InMadaState extends State<InMada> {
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
              // controller: ,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: colorwhite,
                  hintText: "أسم الماده",
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
