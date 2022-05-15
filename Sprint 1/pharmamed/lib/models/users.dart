class Users {
  dynamic id;
  dynamic email;
  dynamic password;
  dynamic role;

  Users(this.email, this.password, this.role);

  Users.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        role = json['role'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'role': role,
      };
}
