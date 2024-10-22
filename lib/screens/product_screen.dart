import 'package:flutter/material.dart';
import 'package:uts_2022110065/providers/product_provider.dart';
import 'package:uts_2022110065/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022110065/screens/cart_screen.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(product.imagePath, height: 200),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 8),
                        Text('0'),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight, 
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} Dimasukan ke keranjang!'),
                    ),
                  );
                },
                child: const Text('Add to cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
