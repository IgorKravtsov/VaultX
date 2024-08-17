import 'package:flutter/material.dart';

class UserInheritedWidget extends InheritedWidget {
  const UserInheritedWidget({
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

  static UserInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>();
  }

  @override
  bool updateShouldNotify(UserInheritedWidget oldWidget) {
    return true;
  }
}
