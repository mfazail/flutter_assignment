import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppState extends ChangeNotifier {
  late Box<Product> _products;

  initHive() async {
    _products = await Hive.openBox<Product>('products');
  }

  Box<Product> get products => _products;

  Future<void> checkAndSaveData() async {
    if (_products.length < 1000) {
      String jsonString = await rootBundle.loadString('assets/generated.json');
      var products = const JsonDecoder().convert(jsonString);
      for (var p in products) {
        Product product = Product();
        product.productName = p['productName'];
        product.productRating = p['productRating'];
        product.productUrl = p['productUrl'];
        product.productDescription = p['productDescription'];
        _products.add(product);
      }
    }
    // print(_products.length);
  }

  void clearData() async {
    _products.clear();
    await checkAndSaveData();
    notifyListeners();
  }
}
