import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imagePath;
  Product({required this.name, required this.price, required this.imagePath});

}

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Product 1', price: 'Rp 134.000', imagePath: 'distrogmbr/screammous.png'),
    Product(name: 'Product 2', price: 'Rp 325.000', imagePath: 'assets/images/product1.png'),
    Product(name: 'Product 3', price: 'Rp 233.000', imagePath: 'assets/images/product1.png'),
    Product(name: 'Product 4', price: 'Rp 123.000', imagePath: 'assets/images/product1.png'),
    Product(name: 'Product 5', price: 'Rp 98.000', imagePath: 'assets/images/product1.png'),
    Product(name: 'Product 6', price: 'Rp 110.000', imagePath: 'assets/images/product1.png'),
  ];

  List<Product> _filteredProducts = [];

  ProductProvider() {
    _filteredProducts = _products;
  }

  List<Product> get products => _filteredProducts;

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
