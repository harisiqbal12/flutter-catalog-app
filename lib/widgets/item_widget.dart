// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.imageURI),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}"),
      ),
    );
  }
}

// class Person {
//   late final String pname;
//   late final int age;

//   Person(this.age, this.pname);
// }

// class Car extends Person {
//   late final String carName;
//   final String color = "red";

//   Car({required int age, required String name, required String carName})
//       : super(age, name);
// }
