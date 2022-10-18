import 'package:favorite/controllers/business_controller.dart';
import 'package:favorite/controllers/cart_controller.dart';
import 'package:favorite/models/address_model.dart';
import 'package:favorite/models/business_model.dart';
import 'package:favorite/models/cart_model.dart';
import 'package:favorite/models/category_model.dart';
import 'package:favorite/models/error_response.dart';
import 'package:favorite/models/orders_model.dart';
import 'package:favorite/models/product_model.dart';
import 'package:favorite/models/response_model.dart';
import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  final businessController = BusinessController();
  final cartController = CartController();

  List<BusinessModel> business = [];
  bool businessLoading = false;
  bool businessError = false;
  Future<dynamic> getBusiness(int idCity) async {
    if (business.isNotEmpty) return;
    businessLoading = true;
    businessError = false;
    notifyListeners();
    final data = await businessController.getBusinesses(idCity);
    if (data is ErrorResponse) {
      businessError = true;
      businessLoading = false;
      notifyListeners();
      return;
    }
    business = data as List<BusinessModel>;
  }

  List<CategoryModel> categories = [];
  bool categoriesLoading = false;
  bool categoriesError = false;
  Future<dynamic> getCategories(int idCity) async {
    if (categories.isNotEmpty) return;
    categoriesLoading = true;
    categoriesError = false;
    notifyListeners();
    final data = await businessController.getCategories(idCity);
    if (data is ErrorResponse) {
      categoriesError = true;
      categoriesLoading = false;
      notifyListeners();
      return;
    }
    categories = data as List<CategoryModel>;
    return categories;
  }

  List<ProductModel> products = [];
  bool productsLoading = false;
  bool productsError = false;
  Future<dynamic> getProducts(
      int? idCity, int? categoryId, String? searchText, String? orderBy) async {
    if (products.isNotEmpty) return;
    productsLoading = true;
    productsError = false;
    notifyListeners();
    final data = await businessController.getProducts(
        idCity: idCity,
        categoryId: categoryId,
        searchText: searchText,
        orderBy: orderBy);
    if (data is ErrorResponse) {
      productsError = true;
      productsLoading = false;
      notifyListeners();
      return;
    }
    products = data as List<ProductModel>;
    return products;
  }

  ProductModel? product;
  bool productLoading = false;
  bool productError = false;
  Future<dynamic> getProduct(int idProduct) async {
    productLoading = true;
    productError = false;
    notifyListeners();
    final data = await businessController.getProduct(idProduct);
    if (data is ErrorResponse) {
      productError = true;
      productLoading = false;
      notifyListeners();
      return;
    }
    productLoading = false;
    productError = false;
    notifyListeners();
    product = data as ProductModel;
    return product;
  }

  CartModel? cart;
  bool cartLoading = false;
  bool cartError = false;
  Future<dynamic> getCart() async {
    cartLoading = true;
    cartError = false;
    notifyListeners();
    final data = await cartController.getCart();
    if (data is ErrorResponse) {
      cartError = true;
      cartLoading = false;
      notifyListeners();
      return;
    }
    cartLoading = false;
    cartError = false;
    notifyListeners();
    cart = data as CartModel;
    return cart;
  }

  Future<dynamic> addProductToCart(int idUser, int idProduct, int items) async {
    cartLoading = true;
    cartError = false;
    notifyListeners();
    final data =
        await cartController.addProductToCart(idUser, idProduct, items);
    if (data is ErrorResponse) {
      cartError = true;
      cartLoading = false;
      notifyListeners();
      return;
    }
    cartLoading = false;
    cartError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }

  Future<dynamic> removeProductFromCart(int id) async {
    cartLoading = true;
    cartError = false;
    notifyListeners();
    final data = await cartController.removeProductFromCart(id);
    if (data is ErrorResponse) {
      cartError = true;
      cartLoading = false;
      notifyListeners();
      return;
    }
    cartLoading = false;
    cartError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }

  Future<dynamic> updateProductFromCart(int idProduct, int items) async {
    cartLoading = true;
    cartError = false;
    notifyListeners();
    final data = await cartController.updateProductFromCart(idProduct, items);
    if (data is ErrorResponse) {
      cartError = true;
      cartLoading = false;
      notifyListeners();
      return;
    }
    cartLoading = false;
    cartError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }

  List<OrderModel> orders = [];
  bool ordersLoading = false;
  bool ordersError = false;
  Future<dynamic> getOrders(int idUser) async {
    if (orders.isNotEmpty) return;
    ordersLoading = true;
    ordersError = false;
    notifyListeners();
    final data = await cartController.getOrders(idUser);
    if (data is ErrorResponse) {
      ordersError = true;
      ordersLoading = false;
      notifyListeners();
      return;
    }
    orders = data as List<OrderModel>;
    return orders;
  }

  Future<dynamic> createOrder(
      idUser, bool cashOnDelivery, List<ProductModel> products) async {
    ordersLoading = true;
    ordersError = false;
    notifyListeners();
    final data =
        await cartController.createOrder(idUser, cashOnDelivery, products);
    if (data is ErrorResponse) {
      ordersError = true;
      ordersLoading = false;
      notifyListeners();
      return;
    }
    ordersLoading = false;
    ordersError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }

  List<AddressModel> addresses = [];
  bool addressesLoading = false;
  bool addressesError = false;
  Future<dynamic> getAddresses(int idUser) async {
    if (addresses.isNotEmpty) return;
    addressesLoading = true;
    addressesError = false;
    notifyListeners();
    final data = await cartController.getAddresses(idUser);
    if (data is ErrorResponse) {
      addressesError = true;
      addressesLoading = false;
      notifyListeners();
      return;
    }
    addresses = data as List<AddressModel>;
    return addresses;
  }

  Future<dynamic> createAddress(int idUser, String label, double latitud,
      double longitude, String address) async {
    addressesLoading = true;
    addressesError = false;
    notifyListeners();
    final data = await cartController.createAddress(
        idUser, label, latitud, longitude, address);
    if (data is ErrorResponse) {
      addressesError = true;
      addressesLoading = false;
      notifyListeners();
      return;
    }
    addressesLoading = false;
    addressesError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }

  Future<dynamic> updateAddress(int idUser, String label, double latitud,
      double longitude, bool main) async {
    addressesLoading = true;
    addressesError = false;
    notifyListeners();
    final data = await cartController.updateAddress(
        idUser, label, latitud, longitude, main);
    if (data is ErrorResponse) {
      addressesError = true;
      addressesLoading = false;
      notifyListeners();
      return;
    }
    addressesLoading = false;
    addressesError = false;
    notifyListeners();
    ResponseModel response = data as ResponseModel;
    return response;
  }
}
