import 'package:flutter/material.dart';

class EditDelete extends StatelessWidget {
  const EditDelete({super.key, required this.icon, required this.color});
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Icon(
        icon,
        color: color,
        size: 26,
      ),
    );
  }
}
