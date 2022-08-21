import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  // variabel
  final String text;
  final double? size;
  final Color? color;

  const AppText({Key? key, required this.text, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
