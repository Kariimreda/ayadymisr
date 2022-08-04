// To parse this JSON data, do
//
//     final cartItem = cartItemFromMap(jsonString);

import 'dart:convert';

/// CartItem model class.
/// This class is used to represent a cart item.
class CartItem {
  CartItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.pricePerItem,
    required this.total,
    required this.minQuant,
    required this.maxQuant,
  });

  int id;
  String imageUrl;
  String title;
  int quantity;
  double pricePerItem;
  double total;
  int minQuant;
  int maxQuant;

  /// Creates a new CartItem object from a JSON string.
  ///
  /// The JSON string must be valid.
  /// If the JSON string is not valid, an exception will be thrown.
  ///
  /// Example:
  /// ```dart
  /// final cartItem = CartItem.fromJson(jsonString);
  /// ```
  factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

  /// Creates a new Json string from a CartItem object.
  ///
  /// Example:
  /// ```dart
  /// final jsonString = cartItem.toJson();
  /// ```
  String toJson() => json.encode(toMap());

  /// Creates a new CartItem object from a map.
  ///
  /// Example:
  /// ```dart
  /// final cartItem = CartItem.fromMap(map);
  /// ```
  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        quantity: json["quantity"],
        pricePerItem: json["pricePerItem"],
        total: json["total"],
        minQuant: json["minQuant"],
        maxQuant: json["maxQuant"],
      );

  /// Creates a new map from a CartItem object.
  ///
  /// Example:
  /// ```dart
  /// final map = cartItem.toMap();
  /// ```
  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "quantity": quantity,
        "pricePerItem": pricePerItem,
        "total": total,
        "minQuant": minQuant,
        "maxQuant": maxQuant,
      };
}
