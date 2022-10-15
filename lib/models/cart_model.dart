import 'package:favorite/models/product_model.dart';

class CartModel {
  CartModel({
    required this.deliveryPrice,
    required this.producs,
  });

  double deliveryPrice;
  List<ProductModel> producs;

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        deliveryPrice: json["delivery_price"].toDouble() ?? 0.0,
        producs: List<ProductModel>.from(
            json["producs"].map((x) => ProductModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "delivery_price": deliveryPrice,
        "producs": List<dynamic>.from(producs.map((x) => x.toMap())),
      };
}
