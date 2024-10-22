import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _cartCount = 0;

  int get cartCount => _cartCount;

  void incrementCartCount() {
    _cartCount++;
    notifyListeners();
  }
}