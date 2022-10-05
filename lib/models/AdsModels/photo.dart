class Photo {
  int id;
  int adId;
  String photo;

  Photo({
    required this.id,
    required this.adId,
    required this.photo,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        adId: json["ad_id"],
        photo: json["photo"].toString(),
      );
}
