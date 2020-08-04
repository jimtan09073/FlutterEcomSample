import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../models/product.model.dart';

class ProductService with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get productList {
    return _productList;
  }

  void addProduct(List<dynamic>list) {
    // _productList.add(Product(id: '123', name: 'tomato', price: 12, stock: 12));
    List<Product> data = list.map((product) => Product.fromJson(product)).toList();
    _productList.addAll(data);
    notifyListeners();
  }

  Future<Response> getProductList() async {
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