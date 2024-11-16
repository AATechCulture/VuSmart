import 'package:flutter/material.dart';
import 'package:parentapp/models/product.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      final List<Product> products = [
        Product(
          id: '1',
          name: 'Product 1',
          price: 19.99,
          imageUrl: 'https://example.com/product1.jpg',
          category: 'Default',
          description: 'Product 1 description',
        ),
        Product(
          id: '2',
          name: 'Product 2',
          price: 29.99,
          imageUrl: 'https://example.com/product2.jpg',
          category: 'Default',
          description: 'Product 2 description',
        ),
      ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
