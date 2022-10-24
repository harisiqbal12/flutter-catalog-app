import "package:flutter/material.dart";


class AppText extends StatelessWidget {
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String title;

  const AppText(
      {super.key,
      this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
