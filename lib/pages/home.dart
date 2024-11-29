import 'package:flutter/material.dart';
import 'package:news/components/customtile.dart';
import 'package:news/model/article_model.dart';
import 'package:news/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.article,
                  size: 30,
                  color: Colors.red[900],
                ))
          ],
          title: Text(
            "News",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          //backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
