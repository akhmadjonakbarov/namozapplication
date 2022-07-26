import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:namozapp/models/xayrehson.dart';
import 'package:http/http.dart' as http;

class XayrEhsonProvider with ChangeNotifier {
  Future getXayrEhson({String? xayrEhsonId}) async {
    final url =
        Uri.parse('http://127.0.0.1:8000/api/xayr-ehsonlar/$xayrEhsonId/');
    var xayrEhson = XayrEhson(
        id: '',
        title: '',
        body: '',
        cardNumber: '',
        phoneNumber: '',
        address: '',
        imageUrl: '');
    try {
      Map<String, dynamic> response = jsonDecode((await http.get(url)).body);
      if (response.isNotEmpty) {
        xayrEhson.id = response['id'];
        xayrEhson.title = response['title'];
        xayrEhson.body = response['body'];
        xayrEhson.cardNumber = response['card_number'];
        xayrEhson.phoneNumber = response['phone_number'];
        xayrEhson.address = response['address'];
        xayrEhson.imageUrl = response['images'];
      }
      return xayrEhson;
    } catch (error) {}
  }
}
