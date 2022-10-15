import 'dart:convert';

import 'package:favorite/models/category_model.dart';

CategoriesListResponse categoriesListResponseFromMap(String str) =>
    CategoriesListResponse.fromMap(json.decode(str));

String categoriesListResponseToMap(CategoriesListResponse data) =>
    json.encode(data.toMap());

class CategoriesListResponse {
  CategoriesListResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  List<CategoryModel> data;

  factory CategoriesListResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesListResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<CategoryModel>.from(
            json["data"].map((x) => CategoryModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

