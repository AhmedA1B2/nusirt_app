import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_t.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2/text_size_s.dart';
import 'package:sirte_university/vars/text.dart';

class CustomW3 extends StatelessWidget {
  const CustomW3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextSizeW2Q(
          titleq: admission,
        ),
        const SizedBox(
          height: 10,
        ),
        TextSizeW2A(
          suptitle:
              requiredToBeAccepted,
        ),
        TextSizeW2A(
          suptitle:
             aQuAc,
        ),
        TextSizeW2A(
          suptitle:
              bQuAc,
        ),
        TextSizeW2A(
          suptitle:
              cQuAc,
        ),
        TextSizeW2A(
          suptitle:
              dQuAc,
        ),
        TextSizeW2A(
          suptitle:
             eQuAc,
        ),
      ],
    );
  }
}
