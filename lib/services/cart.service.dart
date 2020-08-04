import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../models/cart.model.dart';

class CartService with ChangeNotifier {
  // List<CartItem> _cartList = [];
  Map<String, CartItem> _cart = {};

  // int get cartListTotalCount {
  //   return _cartList.isNotEmpty ? _cartList.length : 0;
  // }

  int get cartListTotalCount {
    var item = 0;
    _cart.forEach((key, cartItem) {
      item += cartItem.quantity;
    });
    return item;
  }

  int get cartLength {
    return _cart.length;
  }

  // List<CartItem> get cartList {
  //   return _cartList;
  // }

  Map<String, CartItem> get cartList {
    return {..._cart};
  }

  // void addItem(String id, String name, double price, int qty) {
  //   _cartList.add(CartItem(id: id, name: name, price: price, quantity: qty));
  //   notifyListeners();
  // }

  void addItem(String id, String name, double price, int qty) {
    if (_cart.containsKey(id)) {
      _cart.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _cart.putIfAbsent(
        id,
        () => CartItem(id: id, name: name, quantity: qty, price: price),
      );
    }
    // print(_cart[id].name);
    notifyListeners();
  }

  void clearCart() {
    // _cartList.clear();
    // print(_cartList.length);
    // notifyListeners();

    _cart.clear();
    notifyListeners();
  }

  static Future<Response> getCart() async {
    try {
      Response resp = await Dio().get(
        'http://localhost:5000/cart/get',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
      return Future.value(resp);
    } on DioError catch (err) {
      return Future.error(err);
    }
  }
}
