import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:vaultx/common/user_inherited_widget.dart';
import 'package:vaultx/screens/home/home.dart';

class VaultXApp extends StatefulWidget {
  const VaultXApp({super.key});

  @override
  State<VaultXApp> createState() => _VaultXAppState();
}

class _VaultXAppState extends State<VaultXApp> {
  String? firstName;
  String? lastName;
  String? email;

  void _onUserChanged({
    String? firstName,
    String? lastName,
    required String email,
  }) {
    setState(() {
      this.firstName = firstName;
      this.lastName = lastName;
      this.email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserInheritedWidget(
      onUserChanged: _onUserChanged,
      firstName: firstName,
      lastName: lastName,
      email: email,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppLocalizations.of(context)?.title ?? '',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
