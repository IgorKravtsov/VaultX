import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:vaultx/common/user_inherited_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onSubmit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    UserInheritedWidget.of(context)?.onUserChanged(
      email: _emailController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: localization?.email ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization
                        ?.fieldRequired(localization.email.toLowerCase()) ??
                    '';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: localization?.password ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization
                        ?.fieldRequired(localization.password.toLowerCase()) ??
                    '';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _onSubmit(context),
            child: Text(localization?.login ?? '',
                style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
