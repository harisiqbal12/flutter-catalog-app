// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import "package:velocity_x/velocity_x.dart";

import '../utils/apptext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final res = await rootBundle.loadString("assets/data/data.json");
    final parsedRes = jsonDecode(res);
    final itemsData = parsedRes["products"];
    // List<Item> myList =
    //     List.from(itemsData).map<Item>((e) => Item.fromMap(e)).toList();

    Items.items =
        List.from(itemsData).map<Item>((e) => Item.fromMap(e)).toList();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : AppList()
            ],
          ),
        ),
      ),
    );
  }
}

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
        SizedBox(
          height: 10,
        ),
        AppText(
          title: "Trending Products",
          fontSize: 16,
        ),
      ],
    );
  }
}

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}














// Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: loading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 20,
//                       crossAxisSpacing: 20),
//                   itemBuilder: (context, index) {
//                     final item = Items.items[index];

//                     return Card(
//                         clipBehavior: Clip.antiAlias,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: GridTile(
//                           header: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurple,
//                             ),
//                             child: Text(
//                               item.name,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           footer: Text(item.price.toString()),
//                           child: Image.network(item.imageURI),
//                         ));
//                   },
//                   itemCount: Items.items.length,
//                 )),
//       drawer: CustomDrawer(),