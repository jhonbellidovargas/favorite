import 'dart:convert';

import 'package:favorite/models/address_model.dart';

AddressesListResponse addressesListResponseFromMap(String str) =>
    AddressesListResponse.fromMap(json.decode(str));

String addressesListResponseToMap(AddressesListResponse data) =>
    json.encode(data.toMap());

class AddressesListResponse {
  AddressesListResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  List<AddressModel> data;

  factory AddressesListResponse.fromMap(Map<String, dynamic> json) =>
      AddressesListResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<AddressModel>.from(
            json["data"].map((x) => AddressModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
