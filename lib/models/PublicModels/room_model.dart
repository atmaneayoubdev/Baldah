class RoomModel {
  int chatId;
  List<int> users;
  String createdAt;

  RoomModel({
    required this.chatId,
    required this.users,
    required this.createdAt,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        chatId: json['chatId'],
        users: json['users'],
        createdAt: json['created_at'].toString(),
      );

  RoomModel.fromQuerySnapshot(Map<String, dynamic> snapshot)
      : chatId = snapshot['chatId'],
        users = snapshot['users'],
        createdAt = snapshot['cratedAt'];

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "users": users,
        "created_at": createdAt,
      };
}
