import 'package:grocery_app_smooth_transition/model/cart_item.dart';
import 'package:grocery_app_smooth_transition/model/product.dart';

import 'package:rxdart/rxdart.dart';

import '../constants.dart';

class Bloc {
  final BehaviorSubject<List<Product>> _bProductsList = BehaviorSubject();
  final BehaviorSubject<List<CartItem>> _bCartItems = BehaviorSubject();
  final BehaviorSubject<bool> _bShowTransitionAnimation = BehaviorSubject();
  final BehaviorSubject<bool> _bIsSlidingToCart = BehaviorSubject();
  List<Product> _lProductsList;
  List<CartItem> _lCartItems;

  Bloc() {
    _lProductsList = hardCodedProducts;
    _bProductsList.sink.add(_lProductsList);
    _lCartItems = hardCodedCartList;
    _bCartItems.sink.add(_lCartItems);
    _bShowTransitionAnimation.sink.add(false);
  }

  Stream<List<Product>> get sProductsList => _bProductsList.stream;
  Stream<List<CartItem>> get sCartItems => _bCartItems.stream;
  Stream<bool> get sIsProductTappedForDetail =>
      _bShowTransitionAnimation.stream;
  Stream<bool> get sIsSlidingToCart => _bIsSlidingToCart.stream;

  List<Product> get productsList => _bProductsList.value;
  List<CartItem> get cartItems => _bCartItems.value;

  addProductToCart(Product product, int quantity) {
    bool isProductInTheCartList = false;
    _lCartItems.forEach((e) {
      if (e.product.id == product.id) {
        e.quantity += quantity;
        isProductInTheCartList = true;
      }
    });
    if (!isProductInTheCartList) {
      _lCartItems.insert(0, CartItem(product: product, quantity: quantity));
    }
    _bCartItems.sink.add(_lCartItems);
  }

  triggerTransitionAnimation() =>
      _bShowTransitionAnimation.sink.add(!_bShowTransitionAnimation.value);

  slideToCart() => _bIsSlidingToCart.sink.add(true);

  dispose() {
    _bProductsList.close();
    _bCartItems.close();
    _bShowTransitionAnimation.close();
    _bIsSlidingToCart.close();
  }
}