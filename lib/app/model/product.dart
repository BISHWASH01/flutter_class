// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String? productId;
  final String? productName;
  final String? category;
  final String? productDescription;
  final String? price;
  final String? isInStock;
  final String? imageUrl;
  final String? catId;
  final String? title;

  Product({
    this.productId,
    this.productName,
    this.category,
    this.productDescription,
    this.price,
    this.isInStock,
    this.imageUrl,
    this.catId,
    this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        category: json["category"],
        productDescription: json["productDescription"],
        price: json["price"],
        isInStock: json["isInStock"],
        imageUrl: json["imageURL"],
        catId: json["catID"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "category": category,
        "productDescription": productDescription,
        "price": price,
        "isInStock": isInStock,
        "imageURL": imageUrl,
        "catID": catId,
        "title": title,
      };
}
