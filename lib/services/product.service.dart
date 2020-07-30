import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../models/product.model.dart';

class ProductService with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get productList {
    return this._productList;
  }

  String get test {
    return 'hello world';
  }

  // void addProduct() {
  //   _productList.add(Product(id: '123', name: 'tomato', price: 12, stock: 12));
  //   notifyListeners();
  // }

  void addProduct(List<Product> list) {
    // _productList.add(Product(id: '123', name: 'tomato', price: 12, stock: 12));
    _productList.addAll(list);
    notifyListeners();
  }

  static Future<Response> getProductList() async {
    try {
      Response resp = await Dio().get(
        'http://localhost:5000/item',
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