import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Search extends StatelessWidget {
  const Search({super.key, this.onChanged, this.onClear});

  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)?.searchHint ?? '',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
      ),
    );
  }
}
