import 'dart:convert';

class user {
  final String name;
  final String telp;

  const user({
    required this.name,
    required this.telp,
  });

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      name: json['name'],
      telp: json['telp'],
    );
  }
}
