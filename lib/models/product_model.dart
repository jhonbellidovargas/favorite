import 'package:favorite/models/rate_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.value,
    required this.shortDescription,
    required this.longDescription,
    required this.photos,
    required this.rates,
    required this.available,
  });

  int id;
  String title;
  int value;
  String shortDescription;
  String longDescription;
  List<String> photos;
  List<Rate> rates;
  int available;

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        value: json["value"]  ?? 0,
        shortDescription: json["short_description"] ?? "",
        longDescription: json["long_description"] ?? "",
        photos: List<String>.from(json["photos"].map((x) => x)),
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromMap(x))),
        available: json["available"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "value": value,
        "short_description": shortDescription,
        "long_description": longDescription,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "rates": List<dynamic>.from(rates.map((x) => x.toMap())),
        "available": available,
      };
}
