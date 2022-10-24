class CartProductModel {
  CartProductModel({
    required this.id,
    required this.productId,
    required this.items,
    required this.valuePerUnit,
    required this.productTitle,
    required this.productPhotos,
  });

  int id;
  int productId;
  int items;
  int valuePerUnit;
  String productTitle;
  List<String> productPhotos;

  factory CartProductModel.fromMap(Map<String, dynamic> json) =>
      CartProductModel(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        items: json["items"] ?? 0,
        valuePerUnit: json["value_per_unit"] ?? 0,
        productTitle: json["product_title"] ?? "",
        productPhotos: List<String>.from(json["product_photos"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId,
        "items": items,
        "value_per_unit": valuePerUnit,
        "product_title": productTitle,
        "product_photos": List<dynamic>.from(productPhotos.map((x) => x)),
      };
}
