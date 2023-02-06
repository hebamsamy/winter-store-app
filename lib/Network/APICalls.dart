import 'package:http/http.dart';
import 'dart:convert';

import '../models/Product.dart';

class APICalls {
  Future<Product> GetOne(int id) async {
    Product product = Product(
      id: 0,
      title: "",
      description: "",
      price: 0,
      category: "",
      image: "",
      rating: Rating(rate: 0.0, count: 0),
    );
    try {
      Uri path = Uri.https("fakestoreapi.com", "/products/${id}");
      Response response = await get(path);
      if (response.statusCode == 200) {
        var elem = jsonDecode(response.body);
        product = Product(
          id: elem['id'],
          title: elem['title'],
          description: elem['description'],
          price: elem['price'] + .0,
          category: elem['category'],
          image: elem['image'],
          rating: Rating(
              rate: elem["rating"]['rate'] + .0,
              count: elem["rating"]['count']),
        );
      } else {
        print("error");
      }
    } catch (ex) {
      print(ex.toString());
    }
    return product;
  }

  Future<List<Product>> GetPopularProducts() async {
    List<Product> retutnedList = [];
    Uri url = Uri.https("fakestoreapi.com", "/products/");
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body) as List;
      // print(converted);
      retutnedList = converted
          .map((elem) => Product(
                id: elem['id'],
                title: elem['title'],
                description: elem['description'],
                price: elem['price'] + .0,
                category: elem['category'],
                image: elem['image'],
                rating: Rating(
                    rate: elem["rating"]['rate'] + .0,
                    count: elem["rating"]['count']),
              ))
          .toList();
      print(retutnedList);
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<List<Product>> GetProductByCategory(String category) async {
    List<Product> retutnedList = [];
    Uri url = Uri.https("fakestoreapi.com", "products/category/${category}");
    Response data = await get(url);
    if (data.statusCode == 200) {
      var temp = jsonDecode(data.body) as List;
      retutnedList = temp
          .map((elem) => Product(
                id: elem['id'],
                title: elem['title'],
                description: elem['description'],
                price: elem['price'] + .0,
                category: elem['category'],
                image: elem['image'],
                rating: Rating(
                    rate: elem["rating"]['rate'] + .0,
                    count: elem["rating"]['count']),
              ))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<List<String>> GetCategory() async {
    List<String> retutnedList = [];
    Uri url = Uri.https("fakestoreapi.com", "/products/categories/");
    Response data = await get(url);
    if (data.statusCode == 200) {
      retutnedList = jsonDecode(data.body) as List<String>;
    } else {
      print("Error");
    }
    return retutnedList;
  }
}
