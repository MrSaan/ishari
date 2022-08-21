import 'package:flutter/material.dart';

class AppArabicText extends StatelessWidget {
  // variabel
  final String text;
  final double? size;
  final Color? color;

  const AppArabicText({
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
      ),
    );
  }
}
