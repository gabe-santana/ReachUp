class User {
  String id;
  String name;
  String email;
  String role;
  String token;

  User(this.id, this.name, this.email, this.role, this.token);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }

  User Get(){
    return User(
      "0",
      "José",
      "jose@email.com",
      "cli",
      "xpto"
    );
  }
  bool login()
  {
    return true;
  }

  void logout(){}
}