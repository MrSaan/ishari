import 'package:flutter/material.dart';

class AppArabicBoldText extends StatelessWidget {
  // variabel
  final String text;
  final double? size;
  final Color? color;

  const AppArabicBoldText({
    Key? key,
    required this.text,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
        fontFamily: 'Amiri',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
