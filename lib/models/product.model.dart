import 'package:flutter/foundation.dart';

class Product {
  String id;
  String name;
  String desc;
  double price;
  int stock;

  Product({
    @required this.id,
    @required this.name,
    this.desc,
    @required this.price,
    @required this.stock,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        desc = json['desc'],
        price = json['price'],
        stock = json['stock'];

  Map<String, dynamic> toJson() =>
      {'_id': id, 'name': name, 'desc': desc, 'price': price, 'stock': stock};
}
