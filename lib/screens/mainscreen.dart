import 'package:application_websocket/api/api_service.dart';
import 'package:application_websocket/components/bottom_bar.dart';
import 'package:application_websocket/models/article.dart';
import 'package:application_websocket/screens/article_screen.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  List<String> section = [
    "home",
    "arts",
    "automobiles",
    "business",
    "fashion",
    "food",
    "health",
    "home",
    "insider",
    "magazine",
    "movies",
    "nyregion",
    "obituaries",
    "opinion",
    "politics",
    "realestate",
    "science",
    "sports",
    "sundayreview",
    "technology",
    "theater",
    "books",
    "t - magazine",
    "travel",
    "upshot",
    "us",
    "world"
  ];

  late final _tabController =
      TabController(length: section.length, vsync: this);
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();

    getArticles();
  }

  getArticles() async {
    List<Article> articles =
        await APIService().getArticlesSection(section[_tabController.index]);
    setState(() {
      _articles = articles;
    });
  }

  _launchURL(String url) async {
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
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {},
          selectedFontSize: 16,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ]),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.shade900,
              Colors.blueGrey.shade200,
            ], begin: Alignment.bottomCenter, end: Alignment.topLeft),
          ),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _articles.isNotEmpty
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: TabBarView(
                        controller: _tabController,
                        children: section
                            .map(
                              (tab) => ListView.builder(
                                itemCount: _articles.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Material(
                                        borderRadius: BorderRadius.circular(12),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          onTap: () {
                                            _launchURL(
                                                _articles[index].urlArticle);
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
                                          child: ListTile(
                                            visualDensity:
                                                VisualDensity.standard,
                                            title: Text(
                                              _articles[index].title,
                                            ),
                                            dense: true,
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _articles[index].summary,
                                                ),
                                                Text(
                                                  _articles[index]
                                                      .sectionArticle,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            leading: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.network(
                                                _articles[index].imageURL,
                                                width: mediaQuery.size.width *
                                                    0.20,
                                                fit: BoxFit.cover,
                                              ),
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
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white.withAlpha(230),
                              labelText: 'Search',
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                          DefaultTabController(
                            initialIndex: 0,
                            length: section.length,
                            child: TabBar(
                              onTap: (value) {
                                setState(() {
                                  _tabController.index = value;
                                });
                                getArticles();
                              },
                              controller: _tabController,
                              indicatorColor: Colors.white,
                              isScrollable: true,
                              tabs: section
                                  .map((tab) => Tab(
                                        icon: Text(tab),
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
