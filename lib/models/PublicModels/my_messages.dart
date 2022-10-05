class MyMessages {
  int roomId;
  String seen;
  int userId;
  String photo;
  String lastMessage;
  String name;
  String createdAt;

  MyMessages({
    required this.roomId,
    required this.name,
    required this.photo,
    required this.userId,
    required this.lastMessage,
    required this.seen,
    required this.createdAt,
  });

  factory MyMessages.fromJson(Map<String, dynamic> json) => MyMessages(
        roomId: json['room_id'],
        name: json['name'].toString(),
        photo: json['photo'].toString(),
        lastMessage: json["last_message"].toString(),
        seen: json['seen'].toString(),
        userId: json['user_id'],
        createdAt: json['created_at'].toString(),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "name": name,
        "photo": photo,
        'seen': seen,
        "last_message": lastMessage,
        "user_id": userId,
        "created_at": createdAt,
      };
}
