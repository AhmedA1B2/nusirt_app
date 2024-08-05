// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LibaryCancelItme extends StatelessWidget {
  const LibaryCancelItme({
    super.key,
    required this.bookNmae,
    required this.delete,
    required this.cancel,
  });

  final String bookNmae;
  final String cancel;
  final Widget delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          delete,
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bookNmae,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                cancel,
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
