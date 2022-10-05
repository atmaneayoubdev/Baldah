class Category {
  int id;
  String name;
  String photoPath;

  Category({
    required this.id,
    required this.name,
    required this.photoPath,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json['id'], name: json['name'], photoPath: json['photo'].toString());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photoPath,
      };
}
