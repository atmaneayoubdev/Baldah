import 'package:balda/models/AuthModels/user.dart';

class CommentModel {
  int id;
  int adId;
  User user;
  String comment;
  String createdAt;

  CommentModel({
    required this.id,
    required this.adId,
    required this.user,
    required this.comment,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        adId: json["ad_id"],
        user: User.fromJson(json["user_id"]),
        comment: json["comment"],
        createdAt: json['created_at'],
      );
}
