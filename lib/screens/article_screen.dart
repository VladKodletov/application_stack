// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final String summary;
  final String imageURL;

  const ArticleScreen({
    Key? key,
    required this.summary,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page article')),
      body: Column(
        children: [
          Text(summary),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageURL,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              // height:
              //     MediaQuery.of(context).size.height * 0.12,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
