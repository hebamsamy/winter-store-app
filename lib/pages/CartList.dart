import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/myCart.dart';
import '../models/CartItem.dart';

class CartList extends StatelessWidget {
  List<CartItem> list = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCart>(
      builder: (context, value, child) {
        return Column(
          children: [
            Card(
              child: Column(children: [
                ListTile(
                  tileColor: Color.fromARGB(129, 158, 142, 164),
                  leading: Icon(Icons.attach_money),
                  title: Text("Total Cart Price"),
                  trailing: Text(value.TotalPrice.toString()),
                ),
                ListTile(
                  tileColor: Color.fromARGB(129, 158, 142, 164),
                  leading: Icon(Icons.numbers),
                  title: Text("Count Cart items"),
                  trailing: Text(value.Totalitems.toString()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      tooltip: "Empty Cart",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  title: Text("Empty Cart"),
                                  content: Text(
                                      "are you Sure you want to remove all Cart items?"),
                                  actions: [
                                    IconButton(
                                        onPressed: () {
                                          value.RemoveALL();
                                          Navigator.pop(context, true);
                                        },
                                        icon: Icon(Icons.check)),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        icon: Icon(Icons.close)),
                                  ],
                                )));
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_checkout),
                      label: Text("Order"),
                    ),
                  ],
                )
              ]),
            ),
            Expanded(
              child: (value.list.isEmpty)
                  ? Center(
                      child: Text("No Cart items yet"),
                    )
                  : ListView.builder(
                      itemCount: value.list.length,
                      itemBuilder: (context, i) => Dismissible(
                        background: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 50,
                            ),
                            color: Colors.red),
                        key: ValueKey(value.list[i].id),
                        onDismissed: (direction) {
                          value.RemoveFromCart(value.list[i]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(value.list[i].prd.image)),
                                title: Text(value.list[i].prd.title),
                                trailing: Text("${value.list[i].sup_price} \$"),
                              ),
                              ListTile(
                                leading: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      value.updateCart(
                                          value.list[i], value.list[i].qty + 1);
                                    }),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      value.updateCart(
                                          value.list[i], value.list[i].qty - 1);
                                    }),
                                title: Text(
                                  "${value.list[i].qty} * ${value.list[i].prd.price}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
