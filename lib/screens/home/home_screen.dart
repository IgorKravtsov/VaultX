import 'package:flutter/material.dart';

import 'ui/list.dart';
import 'ui/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Search(), Expanded(child: SegmentsList())],
      ),
    );
  }
}
