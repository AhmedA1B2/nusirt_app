import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class ItemITDay extends StatelessWidget {
  const ItemITDay({super.key, required this.textData, required this.imgData});
  final String textData;
  final Widget imgData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Container(
          decoration:  BoxDecoration(
            color: colorwhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            children: [
              
                HeroMode(child: Hero(
                  tag: 'n',
                  child: imgData)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textData,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
