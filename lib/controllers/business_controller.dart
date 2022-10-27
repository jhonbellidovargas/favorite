import 'dart:convert';
import 'dart:io';

import 'package:favorite/models/category_model.dart';
import 'package:favorite/models/error_response.dart';
import 'package:favorite/models/product_model.dart';
import 'package:favorite/models/responses/business_list_response.dart';
import 'package:favorite/models/responses/categories_list_response.dart';
import 'package:favorite/models/responses/product_detail_response.dart';
import 'package:favorite/models/responses/products_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:favorite/utils/urls.dart';
import 'package:favorite/models/rate_model.dart';

import '../models/business_model.dart';

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
        return BussinesListResponse(
            estado: true,
            code: 200,
            message: "",
            data: [
              BusinessModel(
                id: 1,
                label: "Empresa 1",
                webUrl: "www.Empresa.com",
                photoUrl:
                    "https://www.latercera.com/resizer/7n1Jgn-jZAyn7X-Vv3fRj_U_Fzs=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/KHQALCJNFZHU3GRYSID637CQ7Y.jpg",
              ),
              BusinessModel(
                id: 2,
                label: "Empresa 2",
                webUrl: "www.Empresa.com",
                photoUrl:
                    "https://s2.glbimg.com/rkWLBqBUyhVwj34ENNizehRg2po=/512x320/smart/e.glbimg.com/og/ed/f/original/2017/04/27/gettyimages-452976254.jpg",
              ),
            ]);
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
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
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return CategoriesListResponse(
            estado: true,
            code: 200,
            message: "",
            data: [
              CategoryModel(
                id: 1,
                label: "Popular",
                enabled: true,
                icon: 1,
              ),
              CategoryModel(
                id: 2,
                label: "Western",
                enabled: true,
                icon: 2,
              ),
              CategoryModel(
                id: 3,
                label: "Drinks",
                enabled: true,
                icon: 3,
              ),
              CategoryModel(
                id: 4,
                label: "Local",
                enabled: true,
                icon: 4,
              ),
            ]);
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
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return ProductsListResponse(
            estado: true,
            code: 200,
            message: "",
            data: [
              ProductModel(
                id: 1,
                title: "Producto 1",
                value: 2,
                shortDescription: "Descripcion corta",
                longDescription: "Descripcion larga",
                photos: [
                  "https://s3.amazonaws.com/imagenes-sellers-mercado-ripley/2020/05/27173712/98B315_0.jpg"
                ],
                available: 1,
                rates: [
                  Rate(
                    rate: 2,
                    userName: 'Usuario 1',
                    userPhoto: 'https://i.imgur.com/BoN9kdC.png',
                    date: '2021-01-01',
                    comentary: 'Comentario',
                  ),
                  Rate(
                    rate: 4,
                    userName: 'Usuario 2',
                    userPhoto: 'https://i.imgur.com/D5wcicT.jpeg',
                    date: '2021-01-01',
                    comentary: 'Comentario',
                  ),
                ],
              ),
              ProductModel(
                id: 2,
                title: "Producto 2",
                value: 2,
                shortDescription: "Descripcion corta",
                longDescription: "Descripcion larga",
                photos: [
                  "https://home.ripley.com.pe/Attachment/WOP_5/2005297867853/2005297867853_2.jpg"
                ],
                available: 1,
                rates: [
                  Rate(
                    rate: 2,
                    userName: 'Usuario 1',
                    userPhoto: 'userPhoto',
                    date: '2021-01-01',
                    comentary: 'Comentario',
                  )
                ],
              ),
            ]);
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }

  Future<dynamic> getProduct(int idProduct) async {
    try {
      final response = await http.get(
          Uri.parse('$backUrl/kilometers/product/$idProduct'),
          headers: header);
      if (response.statusCode == 200) {
        final data = productDetailResponseFromMap(response.body);
        return data;
      } else {
        // return ErrorResponse(statusCode: 400, message: "No encontrado");
        return ProductDetailResponse(
            estado: true,
            code: 200,
            message: "",
            data: ProductModel(
              id: 1,
              title: "Producto 1",
              value: 2,
              shortDescription: "Descripcion corta",
              longDescription: "Descripcion larga",
              photos: [
                "https://www.latercera.com/resizer/7n1Jgn-jZAyn7X-Vv3fRj_U_Fzs=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/KHQALCJNFZHU3GRYSID637CQ7Y.jpg"
              ],
              available: 1,
              rates: [
                Rate(
                  rate: 2,
                  userName: 'Usuario 1',
                  userPhoto: 'userPhoto',
                  date: '2021-01-01',
                  comentary: 'Comentario',
                )
              ],
            ));
      }
    } on SocketException {
      return ErrorResponse.network;
    } catch (_) {
      return ErrorResponse.unknown;
    }
  }
}
