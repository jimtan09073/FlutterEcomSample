import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../models/cart.model.dart';

class CartService with ChangeNotifier {
  List<CartItem> _cartList = [];

  int get cartListTotalCount {
    return _cartList.length > 0 ? _cartList.length : 0;
  }

  void addItem(String id, String name, double price, int qty, double subtotal ) {
    _cartList.add(CartItem(id: id, name: name, price: price, quantity: qty, subtotal: subtotal));
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