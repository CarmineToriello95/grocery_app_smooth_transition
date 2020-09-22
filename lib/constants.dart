import 'package:flutter/material.dart';

import 'models/cart_item.dart';
import 'models/product.dart';

const Color primaryColor = Color(0xFFF5F4EF);
const Color cartPageTextColor = Color(0xFFFFFFFF);
const Color buttonsColor = Color(0xFFFFBC41);

const double deliveryPrice = 4.99;

const List<Product> hardCodedProducts = [
  Product(
      id: 0,
      imagePath: 'assets/images/tagliatelle.png',
      price: 3.99,
      name: 'Seggiano Organic Pasta Tagliatelle',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 1,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 5.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 2,
      imagePath: 'assets/images/durum.png',
      price: 2.99,
      name: 'Biona Organic Durum Wheat',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 3,
      imagePath: 'assets/images/tagliatelle.png',
      price: 3.99,
      name: 'Seggiano Organic Pasta Tagliatelle',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 4,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 5.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 5,
      imagePath: 'assets/images/durum.png',
      price: 2.99,
      name: 'Biona Organic Durum Wheat',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
];

List<CartItem> hardCodedCartList = [
  CartItem(
    id: 0,
    product: Product(
      id: 0,
      imagePath: 'assets/images/tagliatelle.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g',
    ),
    quantity: 1,
  )
];
