import 'package:flutter/material.dart';

import 'ui/list.dart';
import 'ui/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  void _onSearchQueryChanged(String query) {
    setState(() {});
  }

  void _onClear() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Search(
            onChanged: _onSearchQueryChanged,
            controller: _searchController,
            onClear: _onClear,
          ),
          Expanded(
              child: SegmentsList(
              searchQuery: _searchController.text,
            ),
          )
        ],
      ),
    );
  }
}
