class ChatModel {
  //int roomId;
  List<int> usersUids;
  List<String> usersNames;
  String category;
  String city;
  DateTime createdAt;
  String title;
  String lastMessage;

  ChatModel({
    //required this.roomId,
    required this.usersUids,
    required this.usersNames,
    required this.category,
    required this.city,
    required this.createdAt,
    required this.title,
    required this.lastMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        usersUids: json['users_uids'],
        usersNames: json['users_names'],
        category: json['catrgory'],
        city: json['city'],
        createdAt: json['createdAt'],
        title: json['title'],
        lastMessage: json['lastMessag'],
      );

  Map<String, dynamic> toJson() => {
        "users_uids": usersUids,
        "users_names": usersNames,
        "category": category,
        "city": city,
        "createdAt": createdAt,
        "title": title,
        "lastMessage": lastMessage,
      };
}
