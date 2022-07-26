// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CategoryDarsliklar with ChangeNotifier {
  String id;
  String title;
  String body;
  CategoryDarsliklar({
    required this.id,
    required this.title,
    required this.body,
  });

  CategoryDarsliklar copyWith({
    String? id,
    String? title,
    String? body,
  }) {
    return CategoryDarsliklar(
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

  factory CategoryDarsliklar.fromMap(Map<String, dynamic> map) {
    return CategoryDarsliklar(
      id: map['id'].toString(),
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDarsliklar.fromJson(String source) =>
      CategoryDarsliklar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryDarsliklar(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant CategoryDarsliklar other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
