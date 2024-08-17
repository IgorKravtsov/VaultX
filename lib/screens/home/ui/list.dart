import 'package:flutter/material.dart';

import 'package:vaultx/screens/home/model/segment.dart';

final segments = List.generate(
  50,
  (index) => Segment(
    title: 'Element ${index + 1}',
    description: 'Description of element ${index + 1}',
  ),
);

class SegmentsList extends StatelessWidget {
  const SegmentsList({super.key, this.searchQuery});

  final String? searchQuery;

  @override
  Widget build(BuildContext context) {
    final filteredSegments = segments.where((segment) {
      final title = segment.title.toLowerCase();
      final description = segment.description.toLowerCase();
      final query = searchQuery?.toLowerCase() ?? '';
      return title.contains(query) || description.contains(query);
    }).toList();
    return ListView.builder(
      itemCount: filteredSegments.length,
      itemBuilder: (context, index) {
        final segment = filteredSegments[index];
        return ListTile(
          title: Text(segment.title),
          subtitle: Text(segment.description),
          leading: const Icon(Icons.circle),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        );
      },
    );
  }
}
