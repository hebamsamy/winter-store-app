import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:store/models/Product.dart';
import 'package:store/provider/myCart.dart';

class ProductItem extends StatelessWidget {
  Product prd;
  ProductItem({required this.prd});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(this.prd.image),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.white30,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        trailing: Consumer<MyCart>(
          builder: (context, value, child) {
            return IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                value.addToCart(prd);
              },
            );
          },
        ),
        title: Text(prd.title),
        subtitle: Text("${prd.price}\$"),
      ),
    );
  }
}
