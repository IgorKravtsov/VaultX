import 'package:flutter/material.dart';

import 'ui/list.dart';
import 'ui/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  void _onSearchQueryChanged(String query) {
    setState(() => _searchQuery = query);
  }

  void _onClear() {
    setState(() => _searchQuery = '');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Search(
            onChanged: _onSearchQueryChanged,
            onClear: _onClear,
          ),
          Expanded(
              child: SegmentsList(
            searchQuery: _searchQuery,
          ))
        ],
      ),
    );
  }
}
