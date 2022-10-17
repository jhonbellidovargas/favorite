import 'dart:convert';
import 'dart:io';

import 'package:favorite/models/error_response.dart';
import 'package:favorite/models/responses/business_list_response.dart';
import 'package:favorite/models/responses/categories_list_response.dart';
import 'package:favorite/models/responses/product_detail_response.dart';
import 'package:favorite/models/responses/products_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:favorite/utils/urls.dart';

class BusinessController {
  BusinessController._privateConstructor();
  static final BusinessController _instance =
      BusinessController._privateConstructor();
  factory BusinessController() => _instance;

  final header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  Future<dynamic> getBusinesses(int idCity) async {
    try {
      final response =
          await http.post(Uri.parse('$backUrl/kilometers/business'),
              headers: header,
              body: json.encode({
                "id_city": idCity,
              }));
      if (response.statusCode == 200) {
        final data = bussinessListResponseFromMap(response.body);
        return data;
      } else {
        return ErrorResponse(statusCode: 400, message: "No encontrado");
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> getCategories(int idCity) async {
    try {
      final response =
          await http.post(Uri.parse('$backUrl/kilometers/categories'),
              headers: header,
              body: json.encode({
                "id_city": idCity,
              }));
      if (response.statusCode == 200) {
        final data = categoriesListResponseFromMap(response.body);
        return data;
      } else {
        return ErrorResponse(statusCode: 400, message: "No encontrado");
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> getProducts({
    int? idCity,
    int? categoryId,
    String? searchText,
    String? orderBy,
  }) async {
    try {
      final response =
          await http.post(Uri.parse('$backUrl/kilometers/products'),
              headers: header,
              body: json.encode({
                "id_city": idCity,
                "category_id": categoryId,
                "search_text": searchText,
                "order_by": orderBy,
              }));
      if (response.statusCode == 200) {
        final data = productsListResponseFromMap(response.body);
        return data;
      } else {
        return ErrorResponse(statusCode: 400, message: "No encontrado");
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> getProductDetail(int idProduct) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/kilometers/product'),
          headers: header,
          body: json.encode({
            "id_product": idProduct,
          }));
      if (response.statusCode == 200) {
        final data = productDetailResponseFromMap(response.body);
        return data;
      } else {
        return ErrorResponse(statusCode: 400, message: "No encontrado");
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }
}
