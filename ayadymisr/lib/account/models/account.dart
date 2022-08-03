import 'dart:convert';

/// ## The Account model class, Defines a user account.
///
/// Objects of this class are created by the [AccountController] class, using the Data
/// returned from the Api.
///   * [email] is not required, but if it is provided, it must be a valid email address.
///   * [phone] however is required and is primarily used for sign in or contact purposes.
class Account {
  /// Creates a new Account object.
  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phone,
  });

  /// The unique identifier of the user.
  int id;

  /// The first name of the user.
  String firstName;

  /// The last name of the user.
  String lastName;

  /// The email address of the user, not required.
  String? email;

  /// The phone number of the user.
  String phone;

  /// Creates an [Account] object from a json string.
  ///
  /// [str] is the json string to be parsed, must be a valid json string.
  /// Throws [FormatException] if the json string is not valid.
  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  /// Creates an [Json] object from an [Account].
  ///
  ///   To use this method, simply call [toJson] on the [Account] object like so:
  /// ```dart
  /// Account account = Account();
  /// String json = account.toJson();
  /// ```
  String toJson() => json.encode(toMap());

  /// Creates an [Account] object from a [Map].
  factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
      );

  /// Creates a [Map] object from an [Account].
  ///
  ///  To use this method, simply call [toMap] on the [Account] object like so:
  /// ```dart
  /// Account account = Account();
  /// Map<String, dynamic> map = account.toMap();
  /// ```
  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };
}
