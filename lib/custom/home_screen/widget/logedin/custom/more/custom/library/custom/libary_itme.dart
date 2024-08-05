import 'package:flutter/material.dart';

class LibaryItme extends StatelessWidget {
  const LibaryItme(
      {super.key,
      required this.onPressedDelete,
      required this.bookNmae,
      required this.endDete});
  final Widget onPressedDelete;

  final String bookNmae;
  final String endDete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              onPressedDelete,
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bookNmae,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                endDete,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
