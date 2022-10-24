class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageURI;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageURI});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        price: map['price'],
        color: map['color'],
        imageURI: map['image']);
  }
}

class Items {
  static List<Item> items = [];
}
