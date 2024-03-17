import 'package:flutter/material.dart';

class TabItem {
  final int id;
  final String title;
  final Widget child;

  TabItem({required this.id, required this.title, required this.child});
}