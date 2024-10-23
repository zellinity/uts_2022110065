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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return ListView.builder(
                    itemCount: cartProvider.cartCount,
                    itemBuilder: (context, index) {
                      final product = cartProvider.cartProducts[index];
                      return CartItem(
                        title: product.name,
                        price: product.price,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: Rp 0',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final String price;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 8),
                const Text('0'),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}