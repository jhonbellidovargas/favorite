import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:favorite/models/error_response.dart';
import 'package:favorite/models/product_model.dart';
import 'package:favorite/models/response_model.dart';
import 'package:favorite/models/responses/addresses_list_response.dart';
import 'package:favorite/models/responses/cart_response.dart';
import 'package:favorite/models/responses/orders_list_response.dart';
import 'package:favorite/utils/urls.dart';
import 'package:http/http.dart' as http;

class CartController {
  CartController._privateConstructor();
  static final CartController _instance = CartController._privateConstructor();
  factory CartController() => _instance;

  final header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  Future<dynamic> getCart({int? idUser, int? idOrder}) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/cart'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "id_order": idOrder,
          }));
      if (response.statusCode == 200) {
        final data = cartResponseFromMap(response.body);
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

  Future<dynamic> addProductToCart(
      {int? idUser, int? idProduct, int? items}) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/cart/add'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "id_product": idProduct,
            "items": items,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  Future<dynamic> removeProductFromCart(
      {int? idUser, int? idProduct, int? items}) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/cart/remove'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "id_product": idProduct,
            "items": items,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  Future<dynamic> updateProductFromCart({int? idProduct, int? items}) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/cart/update'),
          headers: header,
          body: json.encode({
            "id_product": idProduct,
            "items": items,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  Future<dynamic> getOrders(int? idUser) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/orders'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
          }));
      if (response.statusCode == 200) {
        final data = ordersListResponseFromMap(response.body);
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

  Future<dynamic> createOrder(
      int idUser, Bool cashOnDelivery, List<ProductModel> products) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/orders/create'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "cash_on_delivery": cashOnDelivery,
            "products": products,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  Future<dynamic> getAddresses(int idUser) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/addresses'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
          }));
      if (response.statusCode == 200) {
        final data = addressesListResponseFromMap(response.body);
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

  Future<dynamic> createAddress(int idUser, String label, Double latitud,
      Double longitude, String address) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/addresses/create'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "label": label,
            "latitud": latitud,
            "longitude": longitude,
            "address": address,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  Future<dynamic> updateAddress(int idUser, String label, Double latitud,
      Double longitude, Bool main) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/addresses/update'),
          headers: header,
          body: json.encode({
            "id_user": idUser,
            "label": label,
            "latitud": latitud,
            "longitude": longitude,
            "main": main,
          }));
      if (response.statusCode == 200) {
        final data = responseModelFromMap(response.body);
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

  // Future<dynamic> deleteAddress(
}
