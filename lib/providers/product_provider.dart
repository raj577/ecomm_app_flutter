import 'package:assisnment_ecom/models/product.dart';
import '../services/api_service.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  List<Product>? _products;
  bool _isLoading = false;
  String? _error;

  List<Product>? get products => _products?? [];
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts({bool forceRefresh = false}) async{
    if(_products != null && !forceRefresh) return;

    if(_isLoading) return;
    _error = null;
    notifyListeners();

    try{

      final List<Product> fetched = await ApiService().fetchProducts();
      _products = fetched.map((p){
        int stock = p.id % 3 == 0 ? 0 : 20;
        double? disc = p.id % 4 == 0 ? 15.0 : null;
        return Product(
          id: p.id,
          title: p.title,
          description: p.description,
          price: p.price,
          image: p.image,
          category: p.category,
          stock: stock,
          discountPercent: disc,
        );
      }).toList();
    }catch(e){
      _error = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}


