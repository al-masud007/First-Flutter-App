import 'package:first_app/pages/edit_profile_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/main_page.dart';
import 'package:first_app/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    main: (context) => const MainPage(),
    editprofile: (context) => EditProfilePage(),
    nearby: (context) => NearByPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editprofile = '/edit_profile';
  static const nearby = '/NearBy';
}
