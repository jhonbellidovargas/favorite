import 'dart:convert';
import 'dart:io';

import 'package:favorite/models/address_model.dart';
import 'package:favorite/models/cart_model.dart';
import 'package:favorite/models/cart_product_model.dart';
import 'package:favorite/models/error_response.dart';
import 'package:favorite/models/orders_model.dart';
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

  Future<dynamic> getCart(int idUser, int idOrder) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/kilometers/cart'),
          headers: header,
          body: json.encode({
            "user_id": idUser,
            "order_id": idOrder,
          }));
      if (response.statusCode == 200) {
        final data = cartResponseFromMap(response.body);
        return data;
      } else {
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return CartResponse(
            estado: true,
            code: 200,
            message: "",
            data: CartModel(deliveryPrice: 2.5, producs: [
              CartProductModel(
                id: 1,
                productId: 1,
                productTitle: "Producto 1",
                valuePerUnit: 2,
                productPhotos: ["https://picsum.photos/200"],
                items: 1,
              ),
              CartProductModel(
                id: 2,
                productId: 2,
                productTitle: "Producto 2",
                valuePerUnit: 2,
                productPhotos: ["https://picsum.photos/200"],
                items: 3,
              ),
            ]));
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> addProductToCart(int idUser, int idProduct, int items) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/kilometers/cart'),
          headers: header,
          body: json.encode({
            "user_id": idUser,
            "product_id": idProduct,
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

  Future<dynamic> removeProductFromCart(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$backUrl/kilometers/cart/$id'),
        headers: header,
      );
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

  Future<dynamic> updateProductFromCart(int idProduct, int items) async {
    try {
      final response = await http.patch(
        Uri.parse('$backUrl/kilometers/cart/$idProduct'),
        headers: header,
        body: json.encode({
          "product_id": idProduct,
          "items": items,
        }),
      );
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

  Future<dynamic> getOrders(int idUser) async {
    try {
      final response = await http.post(
        Uri.parse('$backUrl/kilometers/orders'),
        headers: header,
        body: json.encode({
          "user_id": idUser,
        }),
      );
      if (response.statusCode == 200) {
        final data = ordersListResponseFromMap(response.body);
        return data;
      } else {
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return OrdersListResponse(estado: true, code: 200, message: "", data: [
          OrderModel(
            id: 1,
            publicId: '1',
            createdAt: DateTime.now(),
            state: '1',
            totalValiue: 1,
          )
        ]);
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> createOrder(
      int idUser, bool cashOnDelivery, List<ProductModel> products) async {
    try {
      final response = await http.post(Uri.parse('$backUrl/kilometers/orders'),
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
      final response =
          await http.post(Uri.parse('$backUrl/kilometers/addresses'),
              headers: header,
              body: json.encode({
                "id_user": idUser,
              }));
      if (response.statusCode == 200) {
        final data = addressesListResponseFromMap(response.body);
        return data;
      } else {
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return AddressesListResponse(
            estado: true,
            code: 200,
            message: "",
            data: [
              AddressModel(
                id: 1,
                label: 'Casa',
                address: 'Direccion 1',
                latitude: 1,
                longitude: 1,
                main: true,
              )
            ]);
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> createAddress(int idUser, String label, double latitud,
      double longitude, String address) async {
    try {
      final response =
          await http.post(Uri.parse('$backUrl/kilometers/addresses'),
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

  Future<dynamic> updateAddress(int idUser, String label, double latitud,
      double longitude, bool main) async {
    try {
      final response = await http.patch(
        Uri.parse('$backUrl/kilometers/addresses/$idUser'),
        headers: header,
        body: json.encode({
          "id_user": idUser,
          "label": label,
          "latitud": latitud,
          "longitude": longitude,
          "main": main,
        }),
      );
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
}
