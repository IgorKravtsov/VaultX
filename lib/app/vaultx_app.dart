import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:vaultx/screens/home/home.dart';

class User extends InheritedWidget {
  const User({
    super.key,
    required super.child,
    this.firstName,
    this.lastName,
    this.email,
    required this.onUserChanged,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final void Function(
      {String? firstName,
      String? lastName,
      required String email}) onUserChanged;

  static User? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<User>();
  }

  @override
  bool updateShouldNotify(User oldWidget) {
    return true;
  }
}

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
    return User(
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
