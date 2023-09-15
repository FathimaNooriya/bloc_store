class StoreModel {
  int? Id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;
  StoreModel(
      {this.Id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});

  StoreModel.fromJson(Map<String, dynamic> json) {
    Id = json['id'] as int;
    title = json['title'] as String;
    price = json['price'] as num;
    category = json['category'] as String;
    description = json['description'] as String;
    image = json['image'] as String;
  }

  static List<StoreModel> toListProducts(List<dynamic> jsonList) {
    return jsonList.map((e) => StoreModel.fromJson(e)).toList();
  }

  
}
