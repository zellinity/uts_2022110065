import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imagePath;
  final String total;
  Product({required this.name, required this.price, required this.imagePath, required this.total});

}

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Screammous T-Shirt', price: 'Rp 134.000', imagePath: 'distrogmbr/screammous.png', total: '0'),
    Product(name: 'Otheruk Jacket', price: 'Rp 325.000', imagePath: 'distrogmbr/otherrukjkt.jpg', total: '0'),
    Product(name: 'Dhgate Jeans', price: 'Rp 233.000', imagePath: 'distrogmbr/dhgatejeans.jpg', total: '0'),
    Product(name: 'Foclis Hoodie', price: 'Rp 123.000', imagePath: 'distrogmbr/foclis.jpg', total: '0'),
    Product(name: 'T-Shirt', price: 'Rp 98.000', imagePath: 'distrogmbr/kaospolos.jpg', total: '0'),
    Product(name: 'Zara Shirt', price: 'Rp 110.000', imagePath: 'distrogmbr/zara.jpg', total: '0'),
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
