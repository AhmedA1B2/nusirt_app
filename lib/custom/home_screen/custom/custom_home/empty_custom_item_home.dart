import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class EmptyItemHome extends StatelessWidget {
  const EmptyItemHome({
    super.key,
    required this.imghome,
    required this.texthome,
  });

  final String imghome;
  final String texthome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: MaterialButton(
        onPressed: () {},
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  imghome,
                  fit: BoxFit.contain,
                ),
                Text(
                  texthome,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
