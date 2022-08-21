import 'package:flutter/material.dart';

class AppArabicStyle extends StatelessWidget {
  // variabel
  final String text;
  final double? size;
  final Color? color;

  const AppArabicStyle({
    Key? key,
    required this.text,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Gulzar',
        fontSize: size,
        color: color,
      ),
    );
  }
}
