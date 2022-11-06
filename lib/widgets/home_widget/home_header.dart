import "package:flutter/material.dart";

import '../../utils/apptext.dart';
import '../../widgets/theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          fontSize: 32,
          color: AppTheme.darkBluishColor,
          fontWeight: FontWeight.bold,
          title: "Catalog App",
        ),
        const SizedBox(
          height: 10,
        ),
        const AppText(
          title: "Trending Products",
          fontSize: 16,
        ),
      ],
    );
  }
}
