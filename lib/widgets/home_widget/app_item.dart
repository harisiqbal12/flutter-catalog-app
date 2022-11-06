import "package:flutter/material.dart";
import 'package:flutter_application_1/utils/apptext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/theme.dart';
import 'item_image.dart';

class AppItem extends StatelessWidget {
  final Item item;
  const AppItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: ItemImage(imageURI: item.imageURI),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title: item.name,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBluishColor,
              ),
              AppText(
                title: item.desc,
                fontWeight: FontWeight.w200,
                color: Colors.black45,
                fontSize: 11,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    "\$${item.price.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.darkBluishColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: const AppText(title: 'Buy', color: Colors.white),
                  )
                ],
              ).pOnly(right: 16)
            ],
          ))
        ],
      ),
    );
  }
}
