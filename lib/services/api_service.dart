import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=f118927669824f00b45ec0b866847885";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Could not fetch news");
    }
  }
}
