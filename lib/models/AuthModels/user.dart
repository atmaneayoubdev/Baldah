class User {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String apiToken;
  String active;
  String upgrade;
  String photo;
  String createdAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.apiToken,
    required this.active,
    required this.upgrade,
    required this.photo,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        firstName: json["firstName"].toString(),
        lastName: json["lastName"].toString(),
        phoneNumber: json["phone_number"].toString(),
        apiToken: json["api_token"].toString(),
        active: json["active"].toString(),
        upgrade: json["upgrade"].toString(),
        photo: json["photo"].toString(),
        createdAt: json["created_at"].toString(),
      );
}
