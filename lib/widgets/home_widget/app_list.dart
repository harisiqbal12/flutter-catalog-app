import "package:flutter/material.dart";
import 'package:flutter_application_1/screens/home_page_details.dart';

import '../../models/catalog.dart';
import 'app_item.dart';

class AppList extends StatelessWidget {
  const AppList({super.key});

  void handleAppItemTap(BuildContext context, Item item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePageDetails(item: item)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Items.items.length,
      itemBuilder: (context, index) {
        final item = Items.getByPos(index);
        return InkWell(
          onTap: (() => handleAppItemTap(context, item)),
          child: AppItem(item: item),
        );
      },
    );
  }
}
