// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          if (cart.totalCount > 0)
            IconButton(
              onPressed: () => _showClearCartDialog(context),
              icon: const Icon(Icons.delete_outline, color: Colors.red),
            ),
        ],
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.network(item.product.image, width: 50),
                  title: Text(item.product.title),
                  subtitle: Text('\$${item.product.discountedPrice.toStringAsFixed(2)} each'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => cart.updateQuantity(item.product, item.quantity - 1),
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () => cart.updateQuantity(item.product, item.quantity + 1),
                        icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () => cart.removeItem(item.product.id),
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Summary & Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Subtotal: \$${cart.subtotal.toStringAsFixed(2)}'),
                if (cart.totalDiscount > 0)
                  Text('Discount: -\$${cart.totalDiscount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
                Text('Tax (5%): \$${cart.tax.toStringAsFixed(2)}'),
                const Divider(),
                Text('Total: \$${cart.grandTotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: const Text('Proceed to Checkout'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () => _showClearCartDialog(context),
                  child: const Text('Empty Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Empty Cart?'),
        content: const Text('Remove all items from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<CartProvider>().clear();
            },
            child: const Text('Empty', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}