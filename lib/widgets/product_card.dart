// lib/widgets/product_card.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:assisnment_ecom/screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('\$${product.price.toStringAsFixed(2)}'),
                    if (product.discountPercent != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${product.discountPercent!.toInt()}% OFF',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 4),
                    // ✅ FIXED: semicolon → comma
                    Text(
                      product.isInStock ? 'In Stock' : 'Out of Stock',
                      style: TextStyle(
                        color: product.isInStock ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600, // ← COMMA, not semicolon!
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}