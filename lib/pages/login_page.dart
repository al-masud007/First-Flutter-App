import 'dart:convert';
import 'dart:io';

import 'package:first_app/User_Provider.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/config/app_string.dart';
import 'package:first_app/model/user.dart';
import 'package:first_app/pages/main_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const baseurl = 'https://dummyjson.com/user/login';

class LoginPage extends StatelessWidget {
  final loginRoute = baseurl;
  // final usernamecontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();
  String username = '';
  String password = '';
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    AppString.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    // AppString.loginTo,
                    'Login to continue',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  TextField(
                    onChanged: (value) {
                      print('username: $value');
                      username = value;
                    },
                    decoration: InputDecoration(
                      hintText: AppString.userName,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    onChanged: (value) {
                      print('password: $value');
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: AppString.passWord,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print('forgot button clicled');
                      },
                      child: const Text(
                        AppString.forgotPass,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final user = await doLogin();
                        UserProvider.of(context)?.updateUser(user);
                        /* Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ),
                        );*/
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.main);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text(
                        AppString.logIn,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppString.orSignIn,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        print('google clicked');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcon.icGoogle,
                            height: 28,
                            width: 28,
                          ),
                          const Text(
                            AppString.signInwithGoogle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        print('FB clicked');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcon.icFcebook,
                            height: 24,
                            width: 24,
                          ),
                          const Text(AppString.signInwithFB),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        AppString.noAccount,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),
                        child: const Text(
                          AppString.signUP,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<User> doLogin() async {
    final body = {
      'username': username,
      'password': password,
    };
    print(username);
    print(password);
    final response = await http.post(
      Uri.parse(loginRoute),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    print(response);
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      final user = User.fromJson(json);
      return user;
    } else {
      print(response.body);
      print('you have an error');
      throw Exception('error');
    }
  }
}
