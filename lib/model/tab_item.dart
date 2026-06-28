import 'package:flutter/material.dart';

class TabItem {
  final IconData icon;
  final IconData filledIcon;
  final String label;
  final bool showBadge;

  const TabItem({
    required this.icon,
    required this.filledIcon,
    required this.label,
    this.showBadge = false,
  });
}
