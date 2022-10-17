class AddressModel {
  AddressModel({
    required this.id,
    required this.label,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.main,
  });

  int id;
  String label;
  double latitude;
  double longitude;
  String address;
  bool main;

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        id: json["id"] ?? 0,
        label: json["label"] ?? "",
        latitude: json["latitude"].toDouble() ?? 0.0,
        longitude: json["longitude"].toDouble() ?? 0.0,
        address: json["address"] ?? "",
        main: json["main"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "main": main,
      };
}
