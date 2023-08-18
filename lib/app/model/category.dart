// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) {
  return List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));
}

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  final String? categoryId;
  final String? categoryTitle;

  Category({
    this.categoryId,
    this.categoryTitle,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["catID"],
        categoryTitle: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "catID": categoryId,
        "title": categoryTitle,
      };
}
