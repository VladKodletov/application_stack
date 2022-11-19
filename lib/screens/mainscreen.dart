import 'package:application_websocket/api/api_service.dart';
import 'package:application_websocket/models/article.dart';
import 'package:application_websocket/screens/article_screen.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        await APIService().getArticlesSection('Automobiles');
    setState(() {
      _articles = articles;
    });
  }

  _launchURL(String url) async {
    // final uriFinal = Uri.encodeFull(url);
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New news'),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.yellow.shade600,
              Colors.yellow.shade900,
            ], begin: Alignment.bottomCenter, end: Alignment.topLeft),
          ),
          padding: const EdgeInsets.all(6),
          child: _articles.isNotEmpty
              ? ListView.builder(
                  itemCount: _articles.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(15)),
                          child: Material(
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                _launchURL(_articles[index].urlArticle);
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return ArticleScreen(
                                //         url: _articles[index].urlArticle,
                                //         // summary: _articles[index].summary,
                                //       );
                                //     },
                                //   ),
                                // );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      _articles[index].imageURL,
                                      width: mediaQuery.size.width,
                                      height: mediaQuery.size.height * 0.2,
                                      // height:
                                      //     MediaQuery.of(context).size.height * 0.12,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    _articles[index].summary,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
