import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class ItemDataC extends StatelessWidget {
  const ItemDataC({super.key, required this.perTextC, required this.imagename});
  final String perTextC;
  final String imagename;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorwhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: Offset(1, 5),
            ),
          ],
        ),
        child: SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
          width: SizeConfig.screenWidth! * 1,
          child: Center(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: Image.asset(
                        imagename,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    perTextC,
                    style:  TextStyle(fontSize: 26, color: bgColor),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
