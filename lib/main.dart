import 'package:first_app/User_Provider.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/pages/edit_profile_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/main_page.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userService: UserService(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Urbanist',
              scaffoldBackgroundColor: AppColors.background,
              brightness: Brightness.dark),
          initialRoute: AppRoutes.login,
          routes: AppRoutes.pages),
    );
  }
}
