// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

class CategoriesDarslik with ChangeNotifier {
  String id;
  String name;
  String body;
  CategoriesDarslik({
    required this.id,
    required this.name,
    required this.body,
  });

  CategoriesDarslik copyWith({
    String? id,
    String? name,
    String? body,
  }) {
    return CategoriesDarslik(
      id: id ?? this.id,
      name: name ?? this.name,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'body': body,
    };
  }

  factory CategoriesDarslik.fromMap(Map<String, dynamic> map) {
    return CategoriesDarslik(
      id: map['id'].toString(),
      name: map['name'].toString(),
      body: map['body'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesDarslik.fromJson(String source) =>
      CategoriesDarslik.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesDarslik(id: $id, name: $name, body: $body)';

  @override
  bool operator ==(covariant CategoriesDarslik other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ body.hashCode;
}
