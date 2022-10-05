class ConversationModel {
  int id;
  int roomId;
  int firstOnline;
  int secondOnline;
  int seen;
  int userId;
  String name;
  String userPhoto;
  String message;
  String createdAt;

  ConversationModel({
    required this.id,
    required this.roomId,
    required this.firstOnline,
    required this.secondOnline,
    required this.seen,
    required this.userId,
    required this.name,
    required this.userPhoto,
    required this.message,
    required this.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json['id'],
        roomId: json['room_id'],
        firstOnline: json['first_online'],
        secondOnline: json['second_online'],
        seen: json['seen'],
        userId: json['user_id'],
        name: json['name'].toString(),
        userPhoto: json['user_photo'].toString(),
        message: json['message'].toString(),
        createdAt: json['created_at'].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roomId": roomId,
        "first_online": firstOnline,
        "second_online": secondOnline,
        "seen": seen,
        "user_id": userId,
        "name": name,
        "userPhoto": userPhoto,
        "message": message,
        "createdAt": createdAt,
      };
}
