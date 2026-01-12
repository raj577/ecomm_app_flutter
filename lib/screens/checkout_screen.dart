import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Items: ${cart.totalCount}'),
            Text('Total: \$${cart.grandTotal.toStringAsFixed(2)}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final success = Random().nextBool();
                if (success) {
                  context.read<CartProvider>().clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                  Navigator.of(context).popUntil((route) => route.isFirst);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment failed. Please try again.'), backgroundColor: Colors.red),
                  );
                }
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
