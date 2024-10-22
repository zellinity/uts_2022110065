import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022110065/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Text('Cart Count: ${cartProvider.cartCount}');
          },
        ),
      ),
    );
  }
}