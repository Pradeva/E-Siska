import 'dart:convert';

class user_login {
  final String email;
  final String pass;

  const user_login({
    required this.email,
    required this.pass,
  });

  factory user_login.fromJson(Map<String, dynamic> json) {
    return user_login(
      email: json['email'],
      pass: json['pass'],
    );
  }
}
