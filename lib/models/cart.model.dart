import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String name;
  int quantity;
  double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        quantity = json['quantity'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}
