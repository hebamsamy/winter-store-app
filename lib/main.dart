import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/myCart.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MyCart>(
            create: (context) => MyCart(),
          ),
        ],
        child: MaterialApp(
          title: 'Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: HomeScreen(),
        ));
  }
}
