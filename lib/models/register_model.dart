class RegisterModel {
  final String email;
  final String password;
  final String name;

  RegisterModel(
      {required this.email, required this.password, required this.name});

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'],
      password: map['password'],
      name: map['name'],
    );
  }
}
