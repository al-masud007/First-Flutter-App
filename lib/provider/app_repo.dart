import 'package:first_app/data/model/user.dart';
import 'package:flutter/material.dart';

class AppRepo extends ChangeNotifier {
  String? _accessToken;
  User? user;

  set token(String? value) {
    _accessToken = value;
  }

  String? get token => _accessToken;
}
