import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_t.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_s.dart';
import 'package:sirte_university/vars/text.dart';

class CustomW6 extends StatelessWidget {
  const CustomW6({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextSizeW2Q(
          titleq:disciplinaryPenalties ,
        ),
        const SizedBox(
          height: 10,
        ),
        TextSizeW2A(
          suptitle:
              expelled,
        ),
        const SizedBox(height: 10),
        TextSizeW2A(
          suptitle:
              aEx,
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 20),
        TextSizeW2Q(
          titleq:
              bEx,
        ),
        TextSizeW2A(
          suptitle:
              aQuEx,
        ),
        const SizedBox(height: 10),
        TextSizeW2A(
          suptitle:
              bQuEx,
        ),
        const SizedBox(height: 10),
        TextSizeW2A(
          suptitle:
              cQuEx,
        ),
        const SizedBox(height: 10),
        TextSizeW2A(
          suptitle:
              dQuEx,
        ),
        const SizedBox(height: 20),
        TextSizeW2Q(
          titleq:
              eQuEx,
        ),
        const SizedBox(height: 10),
        TextSizeW2A(
            suptitle:
             fQuEx   ,),
        const SizedBox(height: 10),
        TextSizeW2A(
            suptitle:
              gQuEx  ,),
        const SizedBox(height: 10),
        TextSizeW2A(
            suptitle:
               hQuEx ,),
        const SizedBox(height: 10),
        TextSizeW2A(
            suptitle:
              iQuEx  ,),
        const SizedBox(height: 10),
        TextSizeW2A(
            suptitle:
              jQuEx ,),
        const SizedBox(height: 10),
      ],
    );
  }
}
