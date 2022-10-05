class City {
  String id;
  String name;
  String createdAt;

  City({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"].toString(),
        name: json["name"].toString(),
        createdAt: json["created_at"].toString(),
      );
}
