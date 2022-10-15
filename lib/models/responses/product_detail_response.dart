import 'dart:convert';

import 'package:favorite/models/product_model.dart';

ProductDetailResponse productDetailResponseFromMap(String str) => ProductDetailResponse.fromMap(json.decode(str));

String productDetailResponseToMap(ProductDetailResponse data) => json.encode(data.toMap());

class ProductDetailResponse {
    ProductDetailResponse({
        required this.estado,
        required this.code,
        required this.message,
        required this.data,
    });

    bool estado;
    int code;
    String message;
    ProductModel data;

    factory ProductDetailResponse.fromMap(Map<String, dynamic> json) => ProductDetailResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: ProductModel.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": data.toMap(),
    };
}