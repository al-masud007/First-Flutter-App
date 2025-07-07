import 'package:first_app/data/response/login_response.dart';
import 'package:first_app/data/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  Future<LoginResponse> Login() async {
    return LoginService(username, password).call();
  }
}
