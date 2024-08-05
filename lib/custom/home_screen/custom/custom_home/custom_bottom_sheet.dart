import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.imgnamebottom,
      required this.textBottom,
      required this.chiledwidget});

  final String imgnamebottom;
  final String textBottom;
  final Widget chiledwidget;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, context) => Stack(
        children: [
          Row(
            children: [
              Container(
                color: bgColor,
                height: SizeConfig.screenHeight! * 1,
                width: SizeConfig.screenWidth! * 0.5,
              ),
              Container(
                color: colorwhite,
                height: SizeConfig.screenHeight! * 1,
                width: SizeConfig.screenWidth! * 0.5,
              ),
            ],
          ),
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * 0.43,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius:
                          const BorderRadius.only(bottomRight: Radius.circular(60)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 5.0, bottom: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.3,
                            width: SizeConfig.screenWidth! * 1,
                            child: Image.asset(
                              imgnamebottom,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Text(
                              textBottom,
                              style:  TextStyle(
                                  fontSize: 26, color: colorwhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        color: colorwhite,
                        borderRadius:
                            const BorderRadius.only(topLeft: Radius.circular(60))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: chiledwidget,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
