import 'dart:convert';
import 'package:bloc_store/model/store_model.dart';
import 'package:http/http.dart' as http;
import '../model/cart_model.dart';
import 'api_constands.dart';

//List<StoreModel> products = [];
//List<CartModel> cartItems = [];

class StoreApi {
  Url url = Url();

  Future<List<StoreModel>> getProducts() async {
     List<StoreModel> products = [];
    String apiUrl = url.baseUrl + url.productUrl;
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);
    if (response.statusCode == 200) {
      print("Success");
      final json = jsonDecode(response.body) as List<dynamic>;
      products.clear();
      products = StoreModel.toListProducts(json);
      return products;
    } else {
      print("failed");
      throw Exception('Something went wrong');
    }
  }

  Future<List<CartModel>> getCartItems() async {
    String apiUrl = url.baseUrl + url.cartUrl;
    final response = await http.get(Uri.parse(apiUrl));
    List<CartModel> cartItems = [];
    print(response.body);
    if (response.statusCode == 200) {
      print("Success cart");
      final json1 = jsonDecode(response.body) as List<dynamic>;
      cartItems.clear();
      cartItems = CartModel.toCartProductList(json1);
      return cartItems;
    } else {
      print("failed");
      throw Exception('Something went wrong');
    }
  }

  Future postProducts() async {
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
    } else {
      print(response.statusCode);
      print("Failed to create post!");
    }
  }
}
