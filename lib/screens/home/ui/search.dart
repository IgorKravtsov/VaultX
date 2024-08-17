import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    this.onClear,
    this.onChanged,
    required this.controller,
  });

  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)?.searchHint ?? '',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: onClear,
        ),
      ),
    );
  }
}
