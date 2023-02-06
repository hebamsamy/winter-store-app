import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/myCart.dart';
import '../models/CartItem.dart';

class CartList extends StatelessWidget {
  List<CartItem> list = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCart>(builder: (context, value, child) {
      if (value.list.isEmpty) {
        return Center(
          child: Text("No cart items yet"),
        );
      } else {
        return ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (context, i) => Dismissible(
                  background: Container(color: Colors.red),
                  key: ValueKey(value.list[i].id),
                  onDismissed: (direction) {
                    value.RemoveFromCart(value.list[i]);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(value.list[i].prd.image)),
                    title: Text(value.list[i].prd.title),
                    trailing: Text(value.list[i].qty.toString()),
                  ),
                ));
      }
    });
  }
}
