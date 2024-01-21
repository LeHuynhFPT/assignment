import 'package:flutter/material.dart';

class Student {
  int? id;
  String name;
  String email;

  Student({this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
