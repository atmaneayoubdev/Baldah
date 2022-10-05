class SubCategory {
  int id;
  String name;
  int categoryId;
  String cratedAt;

  SubCategory({
    required this.id,
    required this.name,
    required this.cratedAt,
    required this.categoryId,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['id'],
        name: json['name'],
        cratedAt: json['created_at'],
        categoryId: json['category_id'],
      );
}
