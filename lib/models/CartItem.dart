import 'package:store/models/Product.dart';

class CartItem {
  int id;
  Product prd;
  int qty;
  double sup_price;
  CartItem({
    required this.id,
    required this.prd,
    required this.sup_price,
    required this.qty,
  });
}
