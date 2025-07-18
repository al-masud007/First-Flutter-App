import 'dart:convert';

import 'package:first_app/config/app_config.dart';
import 'package:first_app/data/response/login_response.dart';
import 'package:first_app/data/service/base_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends BaseService<LoginResponse> {
  final String username;
  final String password;
  LoginService(this.username, this.password);

  @override
  Future<LoginResponse> call() async {
    final result = await http.post(
      Uri.parse(AppConfig.baseurl + AppConfig.login),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    print("Status code: ${result.statusCode}");
    print("Body: ${result.body}");

    if (result.statusCode == 200 &&
        result.headers['content-type']?.contains('application/json') == true) {
      final decoded = jsonDecode(result.body);
      return LoginResponse.fromJson(decoded);
    } else {
      throw Exception('Unexpected response: ${result.body}');
    }
  }
}
