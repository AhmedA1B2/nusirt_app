import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/custom/app_bar_text.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/papre/papre_itme.dart';
import 'package:sirte_university/vars/color.dart';

class PageInMorePapre extends StatefulWidget {
  const PageInMorePapre({super.key});

  @override
  State<PageInMorePapre> createState() => _PageInMorePapreState();
}

class _PageInMorePapreState extends State<PageInMorePapre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Spacer(), AppBarText(title: "الخدمات الورقيه")],
        ),
        backgroundColor: bgColor,
        foregroundColor: colorwhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          children: const [
            PapreItme(textPapreItme: "كشف الدرجات"),
            PapreItme(textPapreItme: "اثبات مستوى"),
            PapreItme(textPapreItme: "تنزيل المواد"),
            PapreItme(textPapreItme: "عيادة طالب"),
            PapreItme(textPapreItme: "افادة تخرج"),
          ],
        ),
      ),
    );
  }
}
