import 'dart:developer';
import 'package:balda/constants.dart';
import 'package:balda/models/PublicModels/my_messages.dart';
import 'package:balda/models/PublicModels/notofication_model.dart';
import 'package:balda/models/PublicModels/sub_catergory.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/PublicModels/bank.dart';
import '../models/PublicModels/category.dart';
import '../models/PublicModels/city.dart';
import '../models/PublicModels/settings.dart';

class PublicContoller with ChangeNotifier {
  ////////////////////////////categories///////////////////////////
  static Future<List<Category>> getCategoties() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}categories",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Category> categories = [];
        categories = (response.data['data'] as List)
            .map((x) => Category.fromJson(x))
            .toList();
        debugPrint("number of categoies${categories.length}");
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////MyMessages///////////////////////////
  static Future<List<MyMessages>> getMyMessages(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.get(
        "${baseUrl}my_conversations",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<MyMessages> messages = [];
        messages = (response.data['data'] as List)
            .map((x) => MyMessages.fromJson(x))
            .toList();
        debugPrint("number of messages${messages.length}");
        return messages;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////Settings///////////////////////////
  static Future<Settings> getSettings() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}settings",
      );
      log(response.data["data"].toString());
      Settings settings;
      settings = Settings.fromJson(response.data["data"]);
      return settings;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////Notifications///////////////////////////
  static Future<List<NotificationModel>> getNotifications() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}list_notifications",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        // List<NotificationModel> notifications = [];
        // notifications = (response.data['data']['data'] as List)
        //     .map((x) => NotificationModel.fromJson(x))
        //     .toList();
        // debugPrint("number of notifications${notifications.length}");
        // return notifications;
        return [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

////////////////////////////Banks///////////////////////////
  static Future<List<Bank>> getBanks() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}banks",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Bank> banks = [];
        banks = (response.data['data'] as List)
            .map((x) => Bank.fromJson(x))
            .toList();
        debugPrint("number of banks${banks.length}");
        return banks;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  ////////////////////////////Citys///////////////////////////
  static Future<List<City>> getCities() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}cities",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<City> cities = [];
        cities = (response.data['data'] as List)
            .map((x) => City.fromJson(x))
            .toList();
        debugPrint("number of citys${cities.length}");
        return cities;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  ////////////////////////////Sub_Categories///////////////////////////
  static Future<List<SubCategory>> getSubCategories(int catID) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}sub_categories/$catID",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<SubCategory> subCatrgories = [];
        subCatrgories = (response.data['data'] as List)
            .map((x) => SubCategory.fromJson(x))
            .toList();
        debugPrint("number of sub_catrgories${subCatrgories.length}");
        return subCatrgories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
