import 'dart:io';

import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/config/app_string.dart';
import 'package:first_app/provider/app_repo.dart';

import 'package:first_app/provider/login_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
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
                      Provider.of<LoginProvider>(context, listen: false)
                          .username = value;
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
                      Provider.of<LoginProvider>(context, listen: false)
                          .password = value;
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
                      onPressed: () {
                        Provider.of<LoginProvider>(context, listen: false)
                            .Login()
                            .then((value) {
                          Provider.of<AppRepo>(context, listen: false).user =
                              value.user;
                          Provider.of<AppRepo>(context, listen: false).token =
                              value.token;

                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.main);
                        });
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
}
