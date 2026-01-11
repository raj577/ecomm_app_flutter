// lib/screens/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/quantity_selector.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          final inCartQty = cart.items
              .firstWhere(
                (i) => i.product.id == product.id,
            orElse: () => CartItem(product: product, quantity: 0),
          )
              .quantity;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.image, height: 200, fit: BoxFit.contain),
                const SizedBox(height: 16),
                Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('\$${product.price.toStringAsFixed(2)}'),
                if (product.discountPercent != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.discountedPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
                const SizedBox(height: 16),
                Text(product.description),
                const SizedBox(height: 24),
                Text("Max Quantity available " + product.maxQuantity.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    const Text('Quantity: '),
                    QuantitySelector(product: product),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: product.isInStock
                          ? () => cart.addItem(product)
                          : null,
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to Cart'),
                    ),
                  ],
                ),
                if (inCartQty > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('✓ Added to cart', style: const TextStyle(color: Colors.green)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}