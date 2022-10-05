import 'package:balda/models/AuthModels/user.dart';

class PaidAd {
  int id;
  User user;
  String details;
  String photo;

  PaidAd({
    required this.id,
    required this.user,
    required this.details,
    required this.photo,
  });

  factory PaidAd.fromJson(Map<String, dynamic> json) => PaidAd(
        id: json["id"],
        user: User.fromJson(json["user"]),
        details: json["details"],
        photo: json['photo'],
      );
}
