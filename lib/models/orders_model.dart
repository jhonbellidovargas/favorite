class OrderModel {
  OrderModel({
    required this.id,
    required this.publicId,
    required this.createdAt,
    required this.state,
    required this.totalValiue,
  });

  int id;
  String publicId;
  DateTime createdAt;
  String state;
  int totalValiue;

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json["id"] ?? 0,
        publicId: json["public_id"] ?? "",
        createdAt: DateTime.parse(json["created_at"]) ?? DateTime.now(),
        state: json["state"] ?? "",
        totalValiue: json["total_valiue"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "public_id": publicId,
        "created_at": createdAt.toIso8601String(),
        "state": state,
        "total_valiue": totalValiue,
      };
}
