import 'package:flutter/material.dart';

class Metric {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  Metric({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      title: json['title'],
      value: json['value'],
      icon: _iconFromString(json['icon']),
      color: _colorFromHex(json['color']),
    );
  }

  static IconData _iconFromString(String icon) {
    switch (icon) {
      case 'visibility':
        return Icons.visibility;
      case 'directions_run':
        return Icons.directions_run;
      case 'access_time':
        return Icons.access_time;
      case 'block':
        return Icons.block;
      default:
        return Icons.info;
    }
  }

  static Color _colorFromHex(String hex) {
    return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
  }
}

class Activity {
  final String title;
  final IconData icon;
  final Color color;

  Activity({
    required this.title,
    required this.icon,
    required this.color,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'],
      icon: Metric._iconFromString(json['icon']),
      color: Metric._colorFromHex(json['color']),
    );
  }
}
