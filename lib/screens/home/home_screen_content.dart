import 'package:flutter/material.dart';

import 'package:vaultx/screens/home/ui/list.dart';
import 'package:vaultx/screens/home/ui/search.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
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
