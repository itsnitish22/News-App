import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constant/strings.dart';
import 'package:news_app/models/news_info.dart';

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    dynamic newsModel;

    try {
      var url = Uri.parse(Strings.newsUrl);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } on Exception {
      return newsModel;
    }

    return newsModel;
  }
}
