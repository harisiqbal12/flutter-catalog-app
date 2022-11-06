// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

import '../../widgets/theme.dart';

class ItemImage extends StatelessWidget {
  final String imageURI;
  const ItemImage({super.key, required this.imageURI});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppTheme.creamColor,
      ),
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height,
      child: Image.network(imageURI),
    );
  }
}
