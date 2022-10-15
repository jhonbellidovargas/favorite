import 'dart:convert';

import 'package:favorite/models/cart_model.dart';

CartResponse cartResponseFromMap(String str) =>
    CartResponse.fromMap(json.decode(str));

String cartResponseToMap(CartResponse data) => json.encode(data.toMap());

class CartResponse {
  CartResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  CartModel data;

  factory CartResponse.fromMap(Map<String, dynamic> json) => CartResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: CartModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": data.toMap(),
      };
}