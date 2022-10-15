import 'dart:convert';

import 'package:favorite/models/product_model.dart';

ProductsListResponse productsListResponseFromMap(String str) =>
    ProductsListResponse.fromMap(json.decode(str));

String productsListResponseToMap(ProductsListResponse data) =>
    json.encode(data.toMap());

class ProductsListResponse {
  ProductsListResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  List<ProductModel> data;

  factory ProductsListResponse.fromMap(Map<String, dynamic> json) =>
      ProductsListResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
