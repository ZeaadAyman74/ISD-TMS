import 'package:flutter/material.dart';

class SettingModel {
  final String? svgIcon;
  final IconData? iconData;
  final String title;
  final VoidCallback onTap;

  SettingModel({
    this.svgIcon,
    this.iconData,
    required this.title,
    required this.onTap,
  });
}
