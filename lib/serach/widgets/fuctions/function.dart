// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../../core/models/result.dart';
import '../../../core/models/trendingmode.dart';


class SearchFunction {
  static ValueNotifier<List<Result>> searchData = ValueNotifier([]);
  static Future<void> searchResult(String quary) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=2ca10457b29d3dad3777ef9ab7239b52&query=$quary'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        TrendingModel pages = TrendingModel.fromJson(data);
        searchData.value.clear();
        searchData.value.addAll(pages.results);
        searchData.notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
