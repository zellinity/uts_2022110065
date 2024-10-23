import 'package:flutter/material.dart';
import 'package:uts_2022110065/providers/product_provider.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartProducts = [];

  List<Product> get cartProducts => _cartProducts;

  void addToCart(Product product) {
    int existingProductIndex = _cartProducts.indexWhere(
      (p) => p.name == product.name,
    );

    if (existingProductIndex != -1) {
      int newQuantity = int.parse(_cartProducts[existingProductIndex].total) + int.parse(product.total);
      double price = double.parse(_cartProducts[existingProductIndex].price.replaceAll('Rp ', ''));
      _cartProducts[existingProductIndex] = Product(
        name: _cartProducts[existingProductIndex].name,
        price: _cartProducts[existingProductIndex].price,
        imagePath: _cartProducts[existingProductIndex].imagePath,
        total: newQuantity.toString(),
      );
    } else {
      _cartProducts.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }

  int get cartCount {
    int totalQuantity = 0;
    for (var product in _cartProducts) {
      totalQuantity += int.parse(product.total);
    }
    return totalQuantity;
  }

  double get totalPrice {
    double total = 0.0;
    for (var product in _cartProducts) {
      double price = double.parse(product.price.replaceAll('Rp', ''));
      total += price * int.parse(product.total);
    }
    return total;
  }
}
