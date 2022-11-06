// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import "package:velocity_x/velocity_x.dart";

import '../widgets/home_widget/app_list.dart';
import '../widgets/home_widget/home_header.dart';
import "package:http/http.dart" as http;

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
    await Future.delayed(const Duration(seconds: 2));
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

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToCart(context),
        backgroundColor: AppTheme.darkBluishColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              loading
                  ? CircularProgressIndicator(
                      color: AppTheme.darkBluishColor,
                    ).centered().expand()
                  : AppList().py16().expand()
            ],
          ),
        ),
      ),
    );
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