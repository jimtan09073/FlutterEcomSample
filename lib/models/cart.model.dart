import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String name;
  int quantity;
  double price;
  double subtotal;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
    @required this.subtotal,
  });

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        quantity = json['quantity'],
        price = json['price'],
        subtotal = json['subtotal'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
        'subtotal': subtotal
      };
}