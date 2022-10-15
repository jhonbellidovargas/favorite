class Rate {
  Rate({
    required this.rate,
    required this.userName,
    required this.userPhoto,
    required this.date,
    required this.comentary,
  });

  double rate;
  String userName;
  String userPhoto;
  String date;
  String comentary;

  factory Rate.fromMap(Map<String, dynamic> json) => Rate(
        rate: json["rate"].toDouble(),
        userName: json["user_name"] ?? "",
        userPhoto: json["user_photo"] ?? "",
        date: json["date"] ?? "",
        comentary: json["comentary"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "user_name": userName,
        "user_photo": userPhoto,
        "date": date,
        "comentary": comentary,
      };
}
