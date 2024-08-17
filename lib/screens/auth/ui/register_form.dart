import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vaultx/app/vaultx_app.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onSubmit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    User.of(context)?.onUserChanged(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
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
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: localization?.firstName ?? '',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization?.fieldRequired(
                              localization.firstName.toLowerCase()) ??
                          '';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: localization?.lastName ?? '',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization?.fieldRequired(
                              localization.lastName.toLowerCase()) ??
                          '';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
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
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: localization?.confirmPassword ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization?.fieldRequired(
                        localization.confirmPassword.toLowerCase()) ??
                    '';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _onSubmit(context),
            child: Text(localization?.register ?? '',
                style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
