import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vaultx/screens/auth/auth_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _onTapItem(BuildContext context) {
    Navigator.pop(context);
  }

  void _onTapLogin(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/images/vaultxLogo.png')),
                const SizedBox(height: 10),
                Text(
                  localization?.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              localization?.drawerNavigationItem1 ?? '',
            ),
            leading: const Icon(Icons.key),
            onTap: () => _onTapItem(context),
          ),
          const Divider(),
          ListTile(
            title: Text(
              localization?.drawerNavigationItem2 ?? '',
            ),
            leading: const Icon(Icons.palette_outlined),
            onTap: () => _onTapItem(context),
          ),
          const Divider(),
          ListTile(
            title: Text(
              localization?.drawerNavigationItem3 ?? '',
            ),
            leading: const Icon(Icons.language),
            onTap: () => _onTapItem(context),
          ),
          const Divider(),
          ListTile(
            title: Text(
              localization?.drawerNavigationItem4 ?? '',
            ),
            leading: const Icon(Icons.login),
            onTap: () => _onTapLogin(context),
          ),
        ],
      ),
    );
  }
}
