class BusinessModel {
  BusinessModel({
    required this.id,
    required this.label,
    required this.webUrl,
    required this.photoUrl,
  });

  final int id;
  final String label;
  final String webUrl;
  final String photoUrl;

  factory BusinessModel.fromMap(Map<String, dynamic> json) => BusinessModel(
        id: json["id"] ?? 0,
        label: json["label"] ?? "",
        webUrl: json["web_url"] ?? "",
        photoUrl: json["photo_url"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "web_url": webUrl,
        "photo_url": photoUrl,
      };
}
