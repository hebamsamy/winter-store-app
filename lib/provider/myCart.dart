import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/models/CartItem.dart';
import 'package:store/models/Product.dart';
//MyCart c = MyCart()
//MyCart.num

///MyCart + ChangeNotifier like marge
class MyCart with ChangeNotifier {
  List<CartItem> _items = [];
  static int num = 0;

  List<CartItem> get list {
    return this._items;
  }

  int get Count {
    return this._items.length;
  }

  addToCart(Product prd) {
    //2
    //1  , 2
    var res = this._items.where((element) => element.prd.id == prd.id).toList();

    if (res.isEmpty) {
      this
          ._items
          .add(CartItem(id: num++, prd: prd, sup_price: 1 * prd.price, qty: 1));
      notifyListeners();
    } else {
      this._items.forEach((elm) {
        if (elm.prd.id == prd.id) {
          elm.qty = elm.qty + 1;
          elm.sup_price = elm.qty * elm.prd.price;
        }
      });
      notifyListeners();
    }
  }

  RemoveFromCart(CartItem val) {
    this._items.remove(val);
    notifyListeners();
  }
}
