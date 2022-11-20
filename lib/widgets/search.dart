import 'package:application_websocket/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final myController = TextEditingController();
  String _search = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      onSubmitted: (value) {
        _search = value;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(
                searchText: _search,
              ),
            ));
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white.withAlpha(230),
        labelText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
