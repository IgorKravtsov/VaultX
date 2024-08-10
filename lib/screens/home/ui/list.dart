import 'package:flutter/material.dart';

import '../model/segment.dart';

final segments = List.generate(
  50,
  (index) => Segment(
    title: 'Element ${index + 1}',
    description: 'Description of element ${index + 1}',
  ),
);

class SegmentsList extends StatelessWidget {
  const SegmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: segments.length,
      itemBuilder: (context, index) {
        final segment = segments[index];
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
