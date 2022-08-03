// To parse this JSON data, do
//
//     final adress = adressFromMap(jsonString);

import 'dart:convert';

/// ## The Address model class, Defines a user address.
///
/// only [company], [secondAdress] and [postalCode] are not required.
class Address {
  /// Creates a new Address object.
  Address({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.company,
    required this.firstAdress,
    this.secondAdress,
    required this.city,
    this.postalCode,
    required this.country,
    required this.governorate,
    required this.virtualAdress,
  });

  /// The unique identifier of the user.
  int id;

  /// The first name of the user.
  String firstName;

  /// The last name of the user.
  String lastName;

  /// The company of the user, not required.
  String? company;

  /// The first adress of the user.
  String firstAdress;

  /// The second adress of the user, not required.
  String? secondAdress;

  /// The city of the user.
  String city;

  /// The postal code of the user, not required.
  String? postalCode;

  /// The country of the user.
  String country;

  /// The governorate of the user.
  String governorate;

  /// whether the address is virtual or not.
  bool virtualAdress;

  /// Creates an [Address] object from a json string.
  ///
  /// [str] is the json string to be parsed, must be a valid json string.
  /// Throws [FormatException] if the json string is not valid.
  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  /// Creates an [Json] object from an [Address].
  ///
  ///  To use this method, simply call [toJson] on the [Address] object like so:
  /// ```dart
  /// Address address = Address();
  /// String json = address.toJson();
  /// ```
  String toJson() => json.encode(toMap());

  /// Creates an [Address] object from a [Map].
  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        company: json["company"],
        firstAdress: json["firstAdress"],
        secondAdress: json["secondAdress"],
        city: json["city"],
        postalCode: json["postalCode"],
        country: json["country"],
        governorate: json["governorate"],
        virtualAdress: json["virtualAdress"],
      );

  /// Creates a [Map] object from an [Address].
  /// To use this method, simply call [toMap] on the [Address] object like so:
  /// ```dart
  /// Address address = Address();
  /// Map<String, dynamic> map = address.toMap();
  /// ```
  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "company": company,
        "firstAdress": firstAdress,
        "secondAdress": secondAdress,
        "city": city,
        "postalCode": postalCode,
        "country": country,
        "governorate": governorate,
        "virtualAdress": virtualAdress,
      };
}
