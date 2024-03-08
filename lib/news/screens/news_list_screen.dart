import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_services.dart';
import '../widgets/news_tile.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final List<News> _news = getMockNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          return NewsTile(news: _news[index]);
        },
      ),
    );
  }
}
