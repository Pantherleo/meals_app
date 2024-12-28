import 'package:flutter/material.dart';

class MealsItemTrairt extends StatelessWidget {
  MealsItemTrairt({super.key, required this.icon, required this.label});
  IconData icon;
  String label;

  String function(label) {
    return label[0].toUpperCase() + label.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(
          function(label),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
