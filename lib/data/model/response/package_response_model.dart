import 'dart:convert';

class PackageResponseModel {
  final String? message;
  final List<Package>? data;

  PackageResponseModel({
    this.message,
    this.data,
  });

  factory PackageResponseModel.fromJson(String str) =>
      PackageResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackageResponseModel.fromMap(Map<String, dynamic> json) =>
      PackageResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Package>.from(json["data"]!.map((x) => Package.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Package {
  final int? id;
  final String? name;
  final dynamic image;
  final int? numberTable;
  final int? slot;
  final dynamic description;
  final int? numberChair;
  final String? price;
  final String? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Package({
    this.id,
    this.name,
    this.image,
    this.numberTable,
    this.slot,
    this.description,
    this.numberChair,
    this.price,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(String str) => Package.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Package.fromMap(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        numberTable: json["number_table"],
        slot: json["slot"],
        description: json["description"],
        numberChair: json["number_chair"],
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
        "image": image,
        "number_table": numberTable,
        "slot": slot,
        "description": description,
        "number_chair": numberChair,
        "price": price,
        "rating": rating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
