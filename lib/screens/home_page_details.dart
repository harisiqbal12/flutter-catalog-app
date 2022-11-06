import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/apptext.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import "package:velocity_x/velocity_x.dart";

class HomePageDetails extends StatelessWidget {
  final Item item;

  const HomePageDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.creamColor,
      ),
      backgroundColor: AppTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.zero,
          children: [
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 250, height: 50),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const AppText(
                  title: 'Add To Cart',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ).py16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Image.network(item.imageURI),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                          color: AppTheme.darkBluishColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      alignment: Alignment.center,
                      child: AppText(
                        title: "\$${item.price.toString()}",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  padding: const EdgeInsets.only(top: 60),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      AppText(
                        title: item.name,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: AppTheme.darkBluishColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        title: item.desc,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis nam voluptatum minus nihil dignissimos expedita eligendi quidem commodi, dolores repudiandae fuga possimus omnis, alias ipsa provident? Vero rem quia cum.	Distinctio sequi alias cupiditate dicta minus, sunt ipsum quisquam! Reiciendis! minus, sunt ipsum quisquam! Reiciendis! minus, sunt ipsum quisquam! Reiciendis!",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black38),
                      ).px16(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
