// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:namozapp/models/categorydarslik.dart';

class CategoryDarslikProvider with ChangeNotifier {
  Future getCategoryDarslik({String? categoryId, String? darslikId}) async {
    var categoryDarslik = CategoryDarslik(id: '', title: '', body: '');
    final url = Uri.parse(
        'http://127.0.0.1:8000/api/category-darsliklar/$categoryId/$darslikId/');
    try {
      Map<String, dynamic> response = jsonDecode((await http.get(url)).body);
      if (response.isNotEmpty) {
        categoryDarslik.id = response['id'].toString();
        categoryDarslik.title = response['title'];
        categoryDarslik.body = response['body'];
      }
      return categoryDarslik;
    } catch (error) {
      rethrow;
    }
  }
}
