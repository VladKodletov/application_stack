import 'package:application_websocket/core/api/api_service.dart';
import 'package:application_websocket/core/models/article.dart';
import 'package:application_websocket/core/models/list_section.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  List<String> category = Section().section;
  late final _tabController =
      TabController(length: category.length, vsync: this);
  List<Article> _articles = [];

  final myController = TextEditingController();
  var _filteredArticles = <Article>[];
  bool _loading = true;

  getArticles() async {
    List<Article> articles =
        await APIService().getArticlesSection(category[_tabController.index]);
    setState(() {
      _articles = articles;
      _loading = false;
    });
  }

  _searchArticles() async {
    await getArticles();
    final query = myController.text;
    if (query.isNotEmpty) {
      _filteredArticles = _articles.where((Article article) {
        return article.title.contains(query) ||
            article.sectionArticle.contains(query);
      }).toList();
      setState(() {
        _filteredArticles;
      
      });
    } else {
      setState(() {
        _filteredArticles = _articles;
      
      });
    }
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
  void initState() {
    super.initState();
    _searchArticles();
    myController.addListener(_searchArticles);
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
          child: _loading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: DefaultTabController(
                        length: category.length,
                        child: TabBarView(
                          controller: _tabController,
                          children: category
                              .map(
                                (tab) => ListView.builder(
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  itemCount: _filteredArticles.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            onTap: () {
                                              _launchURL(
                                                  _filteredArticles[index]
                                                      .urlArticle);
                                            },
                                            child: ListTile(
                                              visualDensity:
                                                  VisualDensity.standard,
                                              title: Text(
                                                _filteredArticles[index].title,
                                              ),
                                              dense: true,
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    maxLines: 3,
                                                    locale: const Locale
                                                            .fromSubtags(
                                                        countryCode: 'UK'),
                                                    _filteredArticles[index]
                                                        .summary,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        locale: const Locale
                                                                .fromSubtags(
                                                            countryCode: 'UK'),
                                                        _filteredArticles[index]
                                                            .sectionArticle,
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            locale: Locale
                                                                .fromSubtags(
                                                                    countryCode:
                                                                        'UK'),
                                                            color: Colors.red),
                                                      ),
                                                      Text(
                                                        '${DateTime.now().difference(DateTime.parse(_filteredArticles[index].dateArticle)).inHours} hours ago',
                                                        maxLines: 3,
                                                        locale: const Locale
                                                                .fromSubtags(
                                                            countryCode: 'UK'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              leading: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  _filteredArticles[index]
                                                      .imageURL!,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        children: [
                          TextField(
                            controller: myController,
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
                          TabBar(
                            onTap: (value) {
                              _searchArticles();
                            },
                            controller: _tabController,
                            indicatorColor: Colors.white,
                            isScrollable: true,
                            tabs: category
                                .map((tab) => Tab(
                                      icon: Text(tab),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
