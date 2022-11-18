import 'package:application_websocket/api/api_service.dart';
import 'package:application_websocket/models/article.dart';
import 'package:application_websocket/screens/article_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Article> _articles = [];
  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  _getArticles() async {
    List<Article> articles =
        await APIService().getArticlesSection('automobiles');
    _articles = articles;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width * 0.85,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Material(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ArticleScreen(
                        // idProductScreen: userSnapshot[int]['id'],
                        //                 priceProductScreen:
                        //                     (userSnapshot[int]['price']).toDouble(),
                        //                 titleProductScreen: userSnapshot[int]
                        //                     ['title'],
                        //                 amountProductScreen:
                        //                     (userSnapshot[int]['amount']).toDouble(),
                        //                 firstImageUrlProductScreen: userSnapshot[int]
                        //                     ['firstImageUrl'],
                        //                 secondImageUrlProductScreen: userSnapshot[int]
                        //                     ['secondImageUrl'],
                        //                 thirdImageUrlProductScreen: userSnapshot[int]
                        //                     ['thirdImageUrl'],
                        //                 descriptionProductScreen: userSnapshot[int]
                        //                     ['description'],
                        //                 isFavoriteProductScreen: userSnapshot[int]
                        //                     ['isFavorite'],
                        );
                  },
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
