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
                    itemCount: cartProvider.cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = cartProvider.cartProducts[index];
                      return CartItem(
                        title: product.name,
                        price: product.price,
                        quantity: product.total,
                        onRemove: () {
                          cartProvider.removeFromCart(product);
                        },
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
                  Text(
                    'Total: Rp ${context.watch<CartProvider>().totalPrice}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementasi checkout
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
  final String quantity;
  final VoidCallback onRemove;

  const CartItem({
    Key? key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onRemove,
  }) : super(key: key);

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
                  'Price: $price',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Quantity: $quantity',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove_circle, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
