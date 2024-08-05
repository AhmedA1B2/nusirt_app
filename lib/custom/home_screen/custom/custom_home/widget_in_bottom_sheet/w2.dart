import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_t.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_s.dart';
import 'package:sirte_university/vars/text.dart';

class CustomW2 extends StatelessWidget {
  const CustomW2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextSizeW2Q(
          titleq: characteristic,
        ),
        const SizedBox(
          height: 10,
        ),
        TextSizeW2A(
          suptitle:
              accepted,
        ),
        TextSizeW2A(
          suptitle:
              a,
        ),
        TextSizeW2A(
          suptitle:
              b,
        ),
        TextSizeW2A(
          suptitle:
              c, ),
        const SizedBox(
          height: 20,
        ),
        TextSizeW2Q(titleq: qLan),
        const SizedBox(
          height: 10,
        ),
        TextSizeW2A(
            suptitle: aQuLan),
        TextSizeW2A(
          suptitle:
              bQuLan,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
