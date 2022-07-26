// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/categorydarsliklar.dart';

class CategoryDarsliklarProvider with ChangeNotifier {
  Future getCategoryDarsliklar({String? categoryId}) async {
    final List<CategoryDarsliklar> loadedCategoryDarsliklar = [];
    final url = Uri.parse(
      'http://127.0.0.1:8000/api/category-darsliklar/$categoryId/',
    );
    try {
      List response = jsonDecode((await http.get(url)).body);
      for (var darslik in response) {
        loadedCategoryDarsliklar.add(CategoryDarsliklar.fromMap(darslik));
      }
      return loadedCategoryDarsliklar;
    } catch (error) {
      rethrow;
    }
  }
}
