class CartModel {
  int? cartId;
  String? date;
  List<product>? cartProduct;

  CartModel(
      {required this.cartId, required this.cartProduct, required this.date});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json["id"] as int;
    date = json["date"] as String;
    cartProduct = <product>[];
    if (json['products'] != null) {
      json['products'].forEach(
        (e) {
          cartProduct!.add(
            product.fromJson(e as Map<String, dynamic>),
          );
        },
      );
    } else {
      print("Product list is null");
    }
  }
  static List<CartModel> toCartProductList(List<dynamic> jsonList) {
    return jsonList.map((e) => CartModel.fromJson(e)).toList();
  }
}

class product {
  int? productId;
  int? quantity;

  product({required this.productId, required this.quantity});

  product.fromJson(Map<String, dynamic> json) {
    productId = json["productId"] as int;
    quantity = json["quantity"] as int;
  }
  // static List<product> toCartProductList(List<dynamic> jsonList) {
  //   return jsonList.map((e) => product.fromJson(e)).toList();
  // }
}
