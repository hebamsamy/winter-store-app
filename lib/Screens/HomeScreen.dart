import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/FavoriteList.dart';
import 'package:store/pages/ProductList.dart';
import 'package:store/pages/profilepage.dart';
import '../provider/myCart.dart';

import '../pages/CartList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Screens = [
    ProductList(),
    CartList(),
    FavoriteList(),
    ProfilePage()
  ];
  int Current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                "https://tse1.mm.bing.net/th?id=OIP.cxcqa9RvhGnRd8x3N2oBdgHaHn&pid=Api&P=0"),
          ),
        ),
        title: const Text("Welcome back, Itiains"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: this.Screens[Current],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int val) {
            setState(() {
              this.Current = val;
            });
          },
          currentIndex: Current,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Products"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Cart ${Provider.of<MyCart>(context).Count}"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Profile"),
          ]),
    );
  }
}
