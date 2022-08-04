// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

/// Product model class. This class is used to represent a Product.
class Product {
  Product({
    required this.id,
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.seller,
    required this.views,
    required this.quantity,
    required this.price,
    required this.priceWithoutTax,
    required this.wishlisted,
  });

  /// unique id of this product.
  int id;

  /// title of this product.
  String title;

  /// rating of this product.
  double rating;

  /// image url of this product.
  String imageUrl;

  /// seller of this product.
  String seller;

  /// weight of this product.
  String views;

  /// quantity of this product.
  int quantity;

  /// price of this product.
  double price;

  /// minimum quantity that can be bought of this product.
  double priceWithoutTax;

  /// whether this product is wishlisted by this user.
  bool wishlisted;

  /// Creates a new Product object from a JSON string.
  /// The JSON string must be valid.
  /// If the JSON string is not valid, an exception will be thrown.
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  /// Creates a new Json string from a Product object.
  ///
  /// Example:
  /// ```dart
  /// final jsonString = product.toJson();
  /// ```
  String toJson() => json.encode(toMap());

  /// Creates a new Product object from a map.
  ///
  /// Example:
  /// ```dart
  /// final product = Product.fromMap(map);
  /// ```
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        rating: json["rating"].toDouble(),
        imageUrl: json["imageUrl"],
        seller: json["seller"],
        views: json["weight"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        priceWithoutTax: json["min"],
        wishlisted: json["wishlisted"],
      );

  /// Creates a map object from a Product object.
  ///
  /// Example:
  /// ```dart
  /// final map = product.toMap();
  /// ```
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "rating": rating,
        "imageUrl": imageUrl,
        "seller": seller,
        "weight": views,
        "quantity": quantity,
        "price": price,
        "min": priceWithoutTax,
        "wishlisted": wishlisted,
      };
}
