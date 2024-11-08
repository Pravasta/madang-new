import 'dart:convert';

class LoginResponseModel {
  final User? user;
  final String? token;

  LoginResponseModel({
    this.user,
    this.token,
  });

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final dynamic emailVerifiedAt;
  final String? role;
  final dynamic photo;
  final dynamic latlong;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.emailVerifiedAt,
    this.role,
    this.photo,
    this.latlong,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        photo: json["photo"],
        latlong: json["latlong"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "photo": photo,
        "latlong": latlong,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
