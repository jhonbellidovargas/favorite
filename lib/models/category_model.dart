class CategoryModel {
  CategoryModel({
    required this.id,
    required this.label,
    required this.enabled,
    required this.icon,
  });

  int id;
  String label;
  bool enabled;
  int icon;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? 0,
        label: json["label"] ?? "",
        enabled: json["enabled"] ?? false,
        icon: json["icon"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "enabled": enabled,
        "icon": icon,
      };
}
