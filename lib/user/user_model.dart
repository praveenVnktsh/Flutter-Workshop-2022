import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final String roll_num;
  final String contact_num;

  User({
    required this.name,
    required this.email,
    required this.roll_num,
    required this.contact_num,
  });

  Map toJson() => {
        'name': this.name,
        'email': this.email,
        'roll_num': this.roll_num,
        'contact_num': this.contact_num,
      };

  factory User.fromJson(dynamic json) {
    return User(
        name: "${json['name']}",
        email: "${json['email']}",
        roll_num: "${json['roll_num']}",
        contact_num: "${json['contact_num']}");
  }
}
