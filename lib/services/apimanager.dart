import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constant/strings.dart';
import 'package:news_app/models/newsInfo.dart';

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var url = Uri.parse(Strings.NEWS_URL);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
