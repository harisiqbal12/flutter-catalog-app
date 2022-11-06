import "package:flutter/material.dart";
import 'package:flutter_application_1/utils/apptext.dart';
import 'package:flutter_application_1/widgets/theme.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppText(
          title: "Cart",
          color: AppTheme.darkBluishColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      backgroundColor: AppTheme.creamColor,
    );
  }
}
