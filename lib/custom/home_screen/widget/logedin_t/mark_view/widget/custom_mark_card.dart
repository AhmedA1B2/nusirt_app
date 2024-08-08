import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class MarkCard extends StatefulWidget {
  const MarkCard({super.key});

  @override
  State<MarkCard> createState() => _MarkCardState();
}

class _MarkCardState extends State<MarkCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline_sharp,
              color: bgColor,
              size: 32,
            ),
            const Spacer(),
            Text(
              "ادخال درجات الطالب",
              style: TextStyle(
                  color: bgColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
