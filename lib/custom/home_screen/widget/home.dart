import 'package:flutter/material.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/custom_item_home.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/empty_custom_item_home.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w1.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w2.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w3.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w4.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w6.dart';
//import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w7.dart';
import 'package:sirte_university/custom/home_screen/custom/custom_home/widget_in_bottom_sheet/w8.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 30),
          children: [
            ItemHome(
              imghome: 'image/home/university_building_icon_195424.png',
              texthome: aboutTheUniversity,
              imagenamebottom: 'image/in/1.png',
              textdatabottom: aboutTheUniversity,
              chiledwidgetbottom: const CustomW1(),
            ),
            ItemHome(
              imghome: 'image/home/q.png',
              texthome: commonQuestions,
              imagenamebottom: 'image/in/2.png',
              textdatabottom: commonQuestions,
              chiledwidgetbottom: const CustomW2(),
            ),
            ItemHome(
              imghome: 'image/home/kbol.png',
              texthome: admissionSystem,
              imagenamebottom: 'image/in/3.png',
              textdatabottom: admissionSystem,
              chiledwidgetbottom: const CustomW3(),
            ),
            ItemHome(
              imghome:
                  'image/home/city_buildings_building_construction_estate_icon_193803.png',
              texthome: faculty,
              imagenamebottom: 'image/in/4.png',
              textdatabottom: faculty,
              chiledwidgetbottom: const CustomW4(),
            ),
            EmptyItemHome(imghome: 'image/home/n.png', texthome: theActivities),
            //ItemHome(
            //  imghome: 'image/home/n.png',
            //  texthome: theActivities,
            //  imagenamebottom: 'image/in/5.png',
            //  textdatabottom: theActivities,
            //chiledwidgetbottom: Column(
            //  children: [
            //    TextButton(
            //      onPressed: () {
            //        Get.to(
            //          () => const TiDay(),
            //          transition: Transition.leftToRight,
            //        );
            //      },
            //      child: const CustomW5(nameimgw: 'image/in/it61.jpeg'),
            //    ),
            //    const SizedBox(
            //      height: 10,
            //    ),
            //    TextButton(
            //        onPressed: () {
            //          Get.to(
            //            () => const ArabDay(),
            //            transition: Transition.leftToRight,
            //          );
            //        },
            //        child: const CustomW5(nameimgw: 'image/in/ad1812.jpeg')),
            //    const SizedBox(
            //      height: 10,
            //    ),
            //    MaterialButton(
            //        onPressed: () {
            //          Get.to(
            //            () => const WebViewNashtat(),
            //            transition: Transition.leftToRight,
            //          );
            //        },
            //        child: const CustomW5(nameimgw: 'image/in/su3.jpg')),
            //  ],
            //  ),
            //  ),
            ItemHome(
              imghome: 'image/home/receipt-paper_icon-icons.com_56152.png',
              texthome: regulations,
              imagenamebottom: 'image/in/6.png',
              textdatabottom: regulations,
              chiledwidgetbottom: const CustomW6(),
            ),
            //  ItemHome(
            //   imghome: 'image/home/f.png',
            //   texthome: universityBranches,
            //   imagenamebottom: 'image/in/7.png',
            //   textdatabottom: universityBranches,
            //   chiledwidgetbottom: const customW7(),
            // ),
            CutomWeb(
              imghome: 'image/home/8.png',
              texthome: website,
            ),
          ],
        ),
      ),
    );
  }
}
