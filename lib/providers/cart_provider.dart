import 'package:flutter/material.dart';
import 'package:uts_2022110065/providers/product_provider.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartProducts = [];

  List<Product> get cartProducts => _cartProducts;

  void addToCart(Product product) {
    _cartProducts.add(product);
    notifyListeners();
  }

  void incrementCartCount(Product product) {
    addToCart(product);
  }

  int get cartCount => _cartProducts.length;
}
