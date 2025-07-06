import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final Widget child;

  final UserService userService;
  const UserProvider({
    required this.userService,
    required this.child,
    super.key,
  }) : super(child: child);

  static UserService? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserProvider>()
        ?.userService;
  }

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return oldWidget.userService.user?.id != userService.user?.id;
  }
}

class UserService {
  User? _user;
  User? get user => _user;
  updateUser(User user) {
    _user = user;
  }
}
