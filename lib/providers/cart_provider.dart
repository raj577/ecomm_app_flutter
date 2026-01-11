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
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex == -1) {
      if (product.stock > 0) {
        _items.add(CartItem(product: product, quantity: 1));
        notifyListeners();
      }
    } else {
      updateQuantity(product, _items[existingIndex].quantity + 1);
    }
  }

  void updateQuantity(Product product, int newQuantity) {
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index == -1) {
      if (newQuantity > 0 && newQuantity <= product.stock && newQuantity <= product.maxQuantity) {
        _items.add(CartItem(product: product, quantity: newQuantity));
        notifyListeners();
      }
    } else {
      if (newQuantity <= 0) {
        _items.removeAt(index);
      } else {
        final clamped = newQuantity.clamp(1, product.stock).clamp(1, product.maxQuantity);
        _items[index].quantity = clamped;
      }
      notifyListeners();
    }
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}