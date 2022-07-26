// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

class XayrEhson with ChangeNotifier {
  String id;
  String title;
  String body;
  String cardNumber;
  String phoneNumber;
  String address;
  String imageUrl;
  XayrEhson({
    required this.id,
    required this.title,
    required this.body,
    required this.cardNumber,
    required this.phoneNumber,
    required this.address,
    required this.imageUrl,
  });

  XayrEhson copyWith({
    String? id,
    String? title,
    String? body,
    String? cardNumber,
    String? phoneNumber,
    String? address,
    String? imageUrl,
  }) {
    return XayrEhson(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      cardNumber: cardNumber ?? this.cardNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'cardNumber': cardNumber,
      'phoneNumber': phoneNumber,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  factory XayrEhson.fromMap(Map<String, dynamic> map) {
    return XayrEhson(
      id: map['id'].toString(),
      title: map['title'] as String,
      body: map['body'] as String,
      cardNumber: map['cardNumber'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      address: map['address'].toString(),
      imageUrl: map['imageUrl'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory XayrEhson.fromJson(String source) =>
      XayrEhson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'XayrEhson(id: $id, title: $title, body: $body, cardNumber: $cardNumber, phoneNumber: $phoneNumber, address: $address, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant XayrEhson other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.cardNumber == cardNumber &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        cardNumber.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        imageUrl.hashCode;
  }
}
