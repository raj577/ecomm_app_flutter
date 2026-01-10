import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class QuantitySelector extends StatelessWidget {
  final Product product;

  const QuantitySelector({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    final item = cart.items.firstWhere(
          (i) => i.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    final qty = item.quantity;

    return Row(
      children: [
        IconButton(
          onPressed: qty > 0 ? () => cart.updateQuantity(product, qty - 1) : null,
          icon: const Icon(Icons.remove),
        ),
        Text('$qty'),
        IconButton(
          onPressed: qty < product.stock && qty < product.maxQuantity
              ? () => cart.updateQuantity(product, qty + 1)
              : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}