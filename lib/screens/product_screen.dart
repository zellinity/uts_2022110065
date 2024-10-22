import 'package:flutter/material.dart';
import 'package:uts_2022110065/screens/cart_screen.dart';

class ProductScreen extends StatelessWidget {
  final String product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/placeholder.png', height: 200),
              ),
              const SizedBox(height: 16),
              // nama product apa saja
              Text(
                product,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              //harga producy yg ada di product
              Text(
                'Rp 9.999.999',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus ac nulla id aliquet. In non sed libero hendrerit, euismod egestas sapien. Nam pretium placerat risus. Donec posuere, dui vitae consectetur maximus, quam eros dictum dui, ut placerat arcu eros ac lectus. Praesent consequat ultrices dui, at venenatis est. Integer vitae bibendum risus, ac euismod arcu sed. Inutile ultrices tellus. Pellentesque ac fermentum quam, non pulvinar sem. Sed tincidunt ex non hendrerit.',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              // Tombol Tambah ke Keranjang
              Row(
                children: [
                  // Tombol Kurangi Kuantitas
                  ElevatedButton( onPressed: () {},
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 8),
                  Text('1'),
                  const SizedBox(width: 8),
                  ElevatedButton(  
                    onPressed: () {},  
                    child: const Icon(Icons.add),  
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              //tombol beli skrg
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: const Text('Beli Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}