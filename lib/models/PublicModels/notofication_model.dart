class NotificationModel {
  int id;
  String title;
  String message;
  String creationDate;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.message,
      required this.creationDate});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
          id: json["id"],
          title: json["title"],
          message: json["message"],
          creationDate: json["created_at"]);
}
