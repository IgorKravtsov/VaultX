import 'package:flutter/material.dart';
import 'package:vaultx/screens/auth/ui/login_form.dart';
import 'package:vaultx/screens/auth/ui/register_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            tabs: [
              Tab(
                text: localization?.authTab1 ?? '',
              ),
              Tab(
                text: localization?.authTab2 ?? '',
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(
                    index,
                    duration: const Duration(milliseconds: 300),
                  );
                },
                children: [
                  LoginForm(),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
