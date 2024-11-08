import 'dart:convert';

class RegisterRequestModel {
  final String? name;
  final String? gender;
  final String? email;
  final String? password;

  RegisterRequestModel({
    this.name,
    this.gender,
    this.email,
    this.password,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        gender: json["gender"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "gender": gender,
        "email": email,
        "password": password,
      };
}
