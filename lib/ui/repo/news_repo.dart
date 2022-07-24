import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:inews/model/news.dart';
import '../../apiKey.dart';

class NewsRepo extends ChangeNotifier {
  List<News>? newsList;
  NewsRepo(String inital) {
    print('NewsRepo $inital');
    fetchData(inital);
  }

  void fetchData(String search) async {
    try {
      newsList = null;
      notifyListeners();
      Response response = await Dio().get('$baseUrl/$search');
      // Response response = await Dio().get('http://localhost:8080/abp/en');

      newsList = List<dynamic>.from(response.data)
          .map((e) => News.fromJson(jsonEncode(e)))
          .toList();
    } catch (e) {
      newsList = null;
    }
    notifyListeners();
  }
}
