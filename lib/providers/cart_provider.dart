import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;
  int get totalCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get subtotal =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  double get totalDiscount =>
      _items.fold(0, (sum, item) => sum + (item.product.price - item.product.discountedPrice) * item.quantity);
  double get tax => (subtotal - totalDiscount) * 0.05;
  double get grandTotal => subtotal - totalDiscount + tax;

  void addItem(Product product) {
    final existingItem = _items.firstWhere(
          (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      if (product.stock <= 0) return;
      final maxQty = product.maxQuantity.clamp(1, product.stock);
      _items.add(CartItem(product: product, quantity: 1));
    } else {
      if (existingItem.quantity >= product.stock) return;
      existingItem.quantity += 1;
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(int productId, int newQuantity) {
    final item = _items.firstWhere((i) => i.product.id == productId);
    if (newQuantity <= 0) {
      removeItem(productId);
    } else if (newQuantity <= item.product.stock && newQuantity <= item.product.maxQuantity) {
      item.quantity = newQuantity;
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}