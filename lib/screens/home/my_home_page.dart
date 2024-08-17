import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vaultx/app/vaultx_app.dart';

import 'package:vaultx/common/ui/app_drawer.dart';
import 'package:vaultx/common/ui/main_bottom_app_bar.dart';

import 'package:vaultx/screens/home/home_screen_content.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final user = User.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          localization?.home ?? '',
        ),
        centerTitle: true,
        actions: [
          if (user?.email != null)
            CircleAvatar(
              child: Text(user?.email?[0].toUpperCase() ?? ''),
            ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const HomeScreenContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: localization?.floatingActionButtonTooltip ?? '',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MainBottomAppBar(),
    );
  }
}
