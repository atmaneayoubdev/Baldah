import 'package:balda/models/AuthModels/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User user = User(
    id: '',
    firstName: '',
    lastName: '',
    phoneNumber: '',
    apiToken: '',
    active: '',
    upgrade: '',
    photo: '',
    createdAt: '',
  );

  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }

  void clearUser() {
    user = User(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      apiToken: '',
      active: '',
      upgrade: '',
      photo: '',
      createdAt: '',
    );
    notifyListeners();
  }
}
