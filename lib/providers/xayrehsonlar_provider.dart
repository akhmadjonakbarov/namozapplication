import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:namozapp/models/xayrehson.dart';

class XayrEhsonlarProvider with ChangeNotifier {
  Future getXayrEhsonlar() async {
    final List<XayrEhson> loadedXayrEhsonlar = [];
    final url = Uri.parse('http://127.0.0.1:8000/api/xayr-ehsonlar/');
    try {
      List response = jsonDecode((await http.get(url)).body);
      for (var element in response) {
        loadedXayrEhsonlar.add(XayrEhson.fromMap(element));
      }

      return loadedXayrEhsonlar;
    } catch (e) {
      rethrow;
    }
  }
}
