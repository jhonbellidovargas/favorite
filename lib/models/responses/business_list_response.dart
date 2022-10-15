import 'dart:convert';
import '../business_model.dart';

BussinesListResponse bussinessListResponseFromMap(String str) =>
    BussinesListResponse.fromMap(json.decode(str));

String bussinesListResponseToMap(BussinesListResponse data) =>
    json.encode(data.toMap());

class BussinesListResponse {
  BussinesListResponse({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool estado;
  final int code;
  final String message;
  final List<BusinessModel> data;

  factory BussinesListResponse.fromMap(Map<String, dynamic> json) =>
      BussinesListResponse(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<BusinessModel>.from(
            json["data"].map((x) => BusinessModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
