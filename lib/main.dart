import 'package:assisnment_ecom/providers/cart_provider.dart';
import 'package:assisnment_ecom/providers/product_provider.dart';
import 'package:assisnment_ecom/screens/cart_screen.dart';
import 'package:assisnment_ecom/screens/checkout_screen.dart';
import 'package:assisnment_ecom/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ],child: const MyApp(),
  ),
  );
}
 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title:"E-comm",
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       routes: {
         '/cart': (context) => const CartScreen(),
         '/checkout': (context) => const CheckoutScreen(),
       },
       home: ProductListScreen(),
     debugShowCheckedModeBanner: false,
     );
   }
 }


