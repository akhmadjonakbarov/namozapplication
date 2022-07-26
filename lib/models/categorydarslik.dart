// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

class CategoryDarslik with ChangeNotifier {
  String id;
  String title;
  String body;
  CategoryDarslik({
    required this.id,
    required this.title,
    required this.body,
  });

  CategoryDarslik copyWith({
    String? id,
    String? title,
    String? body,
  }) {
    return CategoryDarslik(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory CategoryDarslik.fromMap(Map<String, dynamic> map) {
    return CategoryDarslik(
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDarslik.fromJson(String source) =>
      CategoryDarslik.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryDarslik(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant CategoryDarslik other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
