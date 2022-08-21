import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  // variabel
  final double? size;
  final String text;
  final Color? color;

  const AppLargeText({Key? key, required this.text, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
