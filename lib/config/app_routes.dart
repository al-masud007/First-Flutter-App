import 'package:first_app/data/model/user.dart';
import 'package:first_app/pages/edit_profile_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/main_page.dart';
import 'package:first_app/pages/nearby_page.dart';
import 'package:first_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static final pages = {
    login: (context) => ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: const LoginPage()),
    home: (context) => const HomePage(),
    main: (context) => const MainPage(),
    editprofile: (context) => const EditProfilePage(),
    nearby: (context) => const NearByPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editprofile = '/edit_profile';
  static const nearby = '/NearBy';
}
