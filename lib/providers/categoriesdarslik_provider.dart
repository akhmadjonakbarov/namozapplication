import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/categoriesdarslik.dart';

class CategoriesDarslikProvider with ChangeNotifier {
  Future getCategoriesDarslik() async {
    final List<CategoriesDarslik> loadedCategoriesDarslik = [];
    final url = Uri.parse('http://127.0.0.1:8000/api/categories-darslik/');
    try {
      List response = jsonDecode((await http.get(url)).body);
      for (var element in response) {
        loadedCategoriesDarslik.add(CategoriesDarslik.fromMap(element));
      }
      return loadedCategoriesDarslik;
    } catch (error) {
      rethrow;
    }
  }
}
