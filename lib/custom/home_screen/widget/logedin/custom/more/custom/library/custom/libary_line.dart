import 'package:flutter/material.dart';

class LibaryLine extends StatelessWidget {
  const LibaryLine({super.key, required this.textLine});
  final String textLine;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textLine),
            ],
          ),
        ));
  }
}
