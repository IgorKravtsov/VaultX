import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:vaultx/common/ui/app_drawer.dart';
import 'package:vaultx/common/ui/main_bottom_app_bar.dart';
import 'package:vaultx/common/user_inherited_widget.dart';
import 'package:vaultx/screens/home/home_screen_content.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          localization?.home ?? '',
        ),
        centerTitle: true,
        actions: [
          _buildUserAvatar(context),
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

  Widget _buildUserAvatar(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final user = UserInheritedWidget.of(context);

    if (user?.email == null) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(localization?.currentUser ?? ''),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCurrentUserRow(
                  localization?.email ?? '',
                  user?.email,
                ),
                _buildCurrentUserRow(
                  localization?.firstName ?? '',
                  user?.firstName,
                ),
                _buildCurrentUserRow(
                  localization?.lastName ?? '',
                  user?.lastName,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(localization?.close ?? ''),
              ),
            ],
          );
        },
      ),
      child: CircleAvatar(
        child: Text(user?.email?[0].toUpperCase() ?? ''),
      ),
    );
  }

  Row _buildCurrentUserRow(String? title, String? content) {
    return Row(
      children: [
        if (content != null) Text('$title: '),
        Text(content ?? ''),
      ],
    );
  }
}
