// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

/// Category model class. This class is used to represent a category.
///
/// [productCount] is not a required field.
class Category {
  Category({
    required this.id,
    required this.title,
    required this.path,
    this.productCount,
  });

  /// unique id of this category.
  int id;

  /// title of this category.
  String title;

  /// path of this category for API usage.
  String path;

  /// number of products in this category.
  int? productCount;

  /// Creates a new Category object from a JSON string.
  /// The JSON string must be valid.
  /// If the JSON string is not valid, an exception will be thrown.
  ///
  /// Example:
  /// ```dart
  /// final category = Category.fromJson(jsonString);
  /// ```
  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  /// Creates a new Json string from a Category object.
  ///
  /// Example:
  /// ```dart
  /// final jsonString = category.toJson();
  /// ```
  String toJson() => json.encode(toMap());

  /// Creates a new Category object from a map.
  ///
  /// Example:
  /// ```dart
  /// final category = Category.fromMap(map);
  /// ```
  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        path: json["path"],
        productCount: json["productCount"],
      );

  /// Creates a map object from a Category object.
  ///
  /// Example:
  /// ```dart
  /// final map = category.toMap();
  /// ```
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "path": path,
        "productCount": productCount,
      };
}
