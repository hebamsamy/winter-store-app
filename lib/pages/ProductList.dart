import 'package:flutter/material.dart';
import 'package:store/Network/APICalls.dart';
import 'package:store/Widget/ProductItem.dart';
import 'package:store/models/Product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> Products = [];
  APICalls api = APICalls();
  @override
  initState() {
    // super.initState();
    GetData();
  }

  GetData() async {
    List<Product> recived = await api.GetPopularProducts();
    setState(() {
      this.Products = recived;
    });
    print(recived);
  }

  @override
  Widget build(BuildContext context) {
    if (Products.isEmpty) {
      return const Center(
        child: Text("No product yet"),
      );
    } else {
      return GridView.builder(
        itemCount: Products.length,
        itemBuilder: (ctx, i) => ProductItem(prd: Products[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 2),
      );
    }
  }
}
//()?      :        