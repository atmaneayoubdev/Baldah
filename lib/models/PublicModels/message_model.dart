class MessageModel {
  //int roomId;
  int uid;
  String message;
  DateTime createdOn;

  MessageModel({
    //required this.roomId,
    required this.uid,
    required this.message,
    required this.createdOn,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        //roomId: json['room_id'],
        uid: json['user_id'],
        message: json['message'].toString(),
        createdOn: json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        //"roomId": roomId,
        "uid": uid,
        "message": message,
        "createdOn": createdOn,
      };
}
