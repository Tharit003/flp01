import 'package:flutter/material.dart';
import 'package:flutter_pj/model/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop = [
    Product(
      name: "Product1",
      price: 99,
      description: "Item description",
      imagePath: 'lib/assets/image/Fuyu.png'
    ),

    Product(
      name: "Product2",
      price: 99,
      description: "Item description. more description ..........",
      imagePath: 'lib/assets/image/Sedona.png'
    ),

    Product(
      name: "Product3",
      price: 99,
      description: "Item description",
      imagePath: 'lib/assets/image/haran1.png'
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
