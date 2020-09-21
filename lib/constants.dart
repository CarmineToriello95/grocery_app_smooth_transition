import 'package:flutter/material.dart';

import 'model/cart_item.dart';
import 'model/product.dart';

const Color primaryColor = Color(0xFFF5F4EF);
const Color cartPageTextColor = Color(0xFFFFFFFF);
const Color buttonsColor = Color(0xFFFFBC41);

const List<Product> hardCodedProducts = [
  Product(
      id: 0,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 1,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 2,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 3,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 4,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 5,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 6,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 7,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
  Product(
      id: 8,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g'),
];

List<CartItem> hardCodedCartList = [
  CartItem(
    id: 0,
    product: Product(
      id: 0,
      imagePath: 'assets/images/rummo_fusilli.png',
      price: 7.99,
      name: 'Rummo Fusilli No 48 Pasta',
      description:
          'The Lento Lavorazione method comes directly from the traditional and artisan way of making pasta',
      weight: '500g',
    ),
    quantity: 1,
  )
];
