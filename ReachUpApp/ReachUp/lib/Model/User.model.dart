import 'package:ReachUp/Model/Local.dart';

class User {
  String email;
  String name;
  String password;
  String role;
  Local admLocal;
  String token;

  User(
      {this.email,
      this.name,
      this.password,
      this.role,
      this.admLocal,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    role = json['role'];
    admLocal = json['admLocal'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['role'] = this.role;
    data['admLocal'] = this.admLocal;
    data['token'] = this.token;
    return data;
  }
}
