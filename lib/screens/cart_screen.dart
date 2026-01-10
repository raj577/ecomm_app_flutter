// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../screens/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    if (cart.items.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: const Center(child: Text('Your cart is empty')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
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
                        onPressed: () => cart.updateQuantity(item.product, item.quantity - 1), // ✅ Product
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () => cart.updateQuantity(item.product, item.quantity + 1), // ✅ Product
                        icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () => cart.removeItem(item.product.id), // removeItem still uses ID
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // ... summary and checkout button
        ],
      ),
    );
  }
}