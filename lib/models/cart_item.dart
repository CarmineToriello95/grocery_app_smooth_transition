import 'product.dart';

class CartItem {
  int id;
  Product product;
  int quantity;
  double totalAmount;

  CartItem({this.id, this.product, this.quantity, this.totalAmount});
}
