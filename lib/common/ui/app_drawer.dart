import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _onTapItem(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                Text(AppLocalizations.of(context)?.title ?? '',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.drawerNavigationItem1 ?? '',
            ),
            leading: const Icon(Icons.key),
            onTap: () => _onTapItem(context),
          ),
          const Divider(),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.drawerNavigationItem2 ?? '',
            ),
            leading: const Icon(Icons.palette_outlined),
            onTap: () => _onTapItem(context),
          ),
          const Divider(),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.drawerNavigationItem3 ?? '',
            ),
            leading: const Icon(Icons.language),
            onTap: () => _onTapItem(context),
          ),
        ],
      ),
    );
  }
}
