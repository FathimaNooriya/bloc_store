import 'dart:convert';
import 'package:bloc_store/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/cart_model.dart';
import 'api_constands.dart';



class StoreApi {
  Url url = Url();

  Future<List<StoreModel>> getProducts() async {
    List<StoreModel> products = [];
    String apiUrl = url.baseUrl + url.productUrl;
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      products.clear();
      products = StoreModel.toListProducts(json);
      return products;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<CartModel>> getCartItems() async {
    String apiUrl = url.baseUrl + url.cartUrl;
    final response = await http.get(Uri.parse(apiUrl));
    List<CartModel> cartItems = [];
    if (response.statusCode == 200) {
      final json1 = jsonDecode(response.body) as List<dynamic>;
      cartItems.clear();
      cartItems = CartModel.toCartProductList(json1);
      return cartItems;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future postProducts(BuildContext context) async {
    String apiUrl = url.baseUrl + url.postUrl;
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{"StoreName": "MyStore"},
      body: jsonEncode(<String, dynamic>{
        "title": 'test product',
        "price": 13.5,
        "description": 'lorem ipsum set',
        "image": 'https://i.pravatar.cc',
        "category": 'electronic'
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Post created successfully!");
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You have succesfully added"),
          backgroundColor: Color.fromARGB(255, 114, 190, 155),
          duration: Duration(seconds: 10),
        ),
      );
    } else {
      print(response.statusCode);
      print("Failed to create post!");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faild to add the content"),
          backgroundColor: Color.fromARGB(255, 236, 42, 42),
          duration: Duration(seconds: 10),
        ),
      );
    }
  }
}
