import 'dart:convert';

List<ResponseModel> responseModelFromMap(String str) =>
    List<ResponseModel>.from(
        json.decode(str).map((x) => ResponseModel.fromMap(x)));

String responseModelToMap(List<ResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ResponseModel {
  ResponseModel({
    required this.estado,
    required this.code,
    required this.message,
    required this.data,
  });

  bool estado;
  int code;
  String message;
  int data;

  factory ResponseModel.fromMap(Map<String, dynamic> json) => ResponseModel(
        estado: json["estado"] ?? false,
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: json["data"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "code": code,
        "message": message,
        "data": data,
      };
}
