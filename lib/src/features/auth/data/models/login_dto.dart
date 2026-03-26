class LoginDTO {
  LoginDTO({this.email, this.password});

  String? email;
  String? password;

  Map<String, dynamic> toJson() => {'email': email?.trim(), 'password': password};
}
