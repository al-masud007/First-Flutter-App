import 'package:first_app/data/model/user.dart';

class LoginResponse {
  final User user;
  final String? token;

  LoginResponse(this.user, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      User.fromJson(json),
      json['accessToken'],
    );
  }
}
