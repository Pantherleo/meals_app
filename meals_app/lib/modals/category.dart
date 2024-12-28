import 'package:flutter/material.dart';

class Category {
  Category({required this.title, required this.id, this.color = Colors.orange});
  String title;
  String id;
  Color color;
}
