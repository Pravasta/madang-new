import 'dart:convert';

class UserResponseModel {
  final String? status;
  final User? user;

  UserResponseModel({
    this.status,
    this.user,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        status: json["status"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "user": user?.toMap(),
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
