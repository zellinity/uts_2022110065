import 'package:flutter/material.dart';
import 'package:uts_2022110065/providers/product_provider.dart';
import 'package:uts_2022110065/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022110065/screens/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
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
                      child: Image.asset('distrogmbr/kaospolos.jpg', height: 200),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.price,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_quantity > 0) {
                          setState(() {
                            _quantity--;
                          });
                        }
                      },
                      child: const Icon(Icons.remove),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        minimumSize: const Size(50, 50),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$_quantity',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      child: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        minimumSize: const Size(50, 50),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_quantity > 0) {
                      Product newProduct = Product(
                        name: widget.product.name,
                        price: widget.product.price,
                        imagePath: widget.product.imagePath,
                        total: _quantity.toString(),
                      );
                      context.read<CartProvider>().addToCart(newProduct);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${widget.product.name} x$_quantity Dimasukan ke keranjang!'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Silakan pilih jumlah produk yang ingin ditambahkan!')),
                      );
                    }
                  },
                  child: const Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(150, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

