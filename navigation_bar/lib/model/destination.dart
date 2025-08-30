import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.unselectedIcon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final IconData unselectedIcon;
  final MaterialColor color;
}