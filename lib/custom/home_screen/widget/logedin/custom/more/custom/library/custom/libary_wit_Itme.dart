// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LibaryWitItme extends StatelessWidget {
  const LibaryWitItme({
    super.key,
    required this.bookNmae,
    required this.delete, required this.eidt,
  });

  final String bookNmae;
  final Widget delete;
  final Widget eidt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              delete,
              eidt,
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
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "في انتظار الرد",
                style: TextStyle(
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
