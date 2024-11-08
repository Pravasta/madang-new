import 'dart:convert';

class MenuResponseModel {
  final String? message;
  final List<Menu>? data;

  MenuResponseModel({
    this.message,
    this.data,
  });

  factory MenuResponseModel.fromJson(String str) =>
      MenuResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MenuResponseModel.fromMap(Map<String, dynamic> json) =>
      MenuResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Menu>.from(json["data"]!.map((x) => Menu.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Menu {
  final int? id;
  final String? name;
  final String? category;
  final dynamic image;
  final String? price;
  final String? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Menu({
    this.id,
    this.name,
    this.category,
    this.image,
    this.price,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Menu.fromJson(String str) => Menu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        image: json["image"],
        price: json["price"],
        rating: json["rating"],
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
        "category": category,
        "image": image,
        "price": price,
        "rating": rating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
