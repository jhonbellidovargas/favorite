import 'dart:convert';

import 'package:favorite/models/orders_model.dart';

OrdersListResponse ordersListResponseFromMap(String str) =>
    OrdersListResponse.fromMap(json.decode(str));

String ordersListResponseToMap(OrdersListResponse data) =>
    json.encode(data.toMap());

class OrdersListResponse {
  OrdersListResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  List<OrderModel> data;

  factory OrdersListResponse.fromMap(Map<String, dynamic> json) =>
      OrdersListResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<OrderModel>.from(
            json["data"].map((x) => OrderModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
