import 'dart:developer';
import 'dart:io';
import 'package:balda/constants.dart';
import 'package:balda/models/AdsModels/ad.dart';
import 'package:balda/models/AdsModels/ad_details.dart';
import 'package:balda/models/AdsModels/paid_ad.dart';
import 'package:balda/models/PublicModels/conversation_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class AdsController with ChangeNotifier {
  ////////////////////////////create add/////////////////////
  static Future createAd({
    required String token,
    required String cityId,
    required String categorieId,
    required String subCategorieId,
    required String price,
    required String title,
    required String details,
    required List<File> images,
  }) async {
    Dio dio = Dio();
    Map<String, String> headers = {
      'Content-type': 'multipart/from-data',
      "Accept": "application/json",
      'Authorization': "Bearer $token",
    };

    // List<MultipartFile> files = [];
    // for (var item in images) {
    //   String fileName = item.path.split('/').last;
    //   files.add(await MultipartFile.fromFile(item.path, filename: fileName));
    // }
    FormData formData = FormData.fromMap({
      'city_id': cityId,
      "category_id": categorieId,
      "sub_category_id": subCategorieId,
      "title": title,
      'details': details,
      "price": price,
    });
    for (var file in images) {
      formData.files.addAll([
        MapEntry("photos[]", await MultipartFile.fromFile(file.path)),
      ]);
    }

    var response = await dio.post("${baseUrl}create_ad",
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: headers,
        ));
    if (kDebugMode) {
      print(response.data);
      print(response.statusMessage);
    }

    return response.statusMessage!;
  }

  ////////////////////////////ads///////////////////////////
  static Future<Map<String, dynamic>> getAds(
      String token, int pageNumber) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}get_ads?page=$pageNumber",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of ads${ads.length}");
        return {
          "ads": ads,
          "next": response.data["data"]['next_page_url'].toString() == "null"
              ? false
              : true,
          "size": response.data['per_page'],
        };
      } else {
        return {};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  ////////////////////////////adDetails///////////////////////////
  static Future<AdDetails> getAdDetails(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}ad_details/$id",
      );
      log(response.data["data"].toString());
      AdDetails adDetails;
      adDetails = AdDetails.fromJson(response.data["data"]["ad"]);
      return adDetails;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////similar_ads///////////////////////////
  static Future<List<Ad>> getSimilarAds(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}ad_details/$id",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> similarAds = [];
        similarAds = (response.data['data']['similar_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of Similar Ads${similarAds.length}");
        return similarAds;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////_activeAds///////////////////////////
  static Future<List<Ad>> gatActiveAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['active_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of active ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////finished ads///////////////////////////
  static Future<List<Ad>> getFinishedAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['finished_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of finished ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////re_publish-ad///////////////////////////
  static Future rePublishAds(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}re_publish_ad/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////delete-ad///////////////////////////
  static Future deleteAd(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}delete_ad/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////delete-ad_photo///////////////////////////
  static Future deleteAdPhoto(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}delete_ad_photo/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////special gelleries///////////////////////////
  static Future<List<Ad>> getSpecailGaleries(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}special_galleries",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of special galleries${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////favorite ads///////////////////////////
  static Future<List<Ad>> getFavoriteAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_favorite_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of favorite ads ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////add_ad_to_favorite///////////////////////////
  static Future addFavorite(int id, String token) async {
    log(id.toString());
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}add_ad_to_favorite/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } on DioError catch (e) {
      log(e.message);
      return "error";
    }
  }

  ////////////////////////////remove from favorite///////////////////////////
  static Future removeFavorite(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}remove_ad_from_favorite/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } on DioError catch (e) {
      log(e.message);
      return "error";
    }
  }

  ////////////////////////////Paid ads///////////////////////////
  static Future<List<PaidAd>> getPaidAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}paid_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<PaidAd> paidAds = [];
        paidAds = (response.data['data'] as List)
            .map((x) => PaidAd.fromJson(x))
            .toList();
        debugPrint("number of paid Ads ${paidAds.length}");
        return paidAds;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////reate_ad///////////////////////////
  static Future rateAd(int id, String rate, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio
          .post("${baseUrl}rate_ad", data: {"ad_id": id, "rate": rate});

      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////As search///////////////////////////
  static Future<List<Ad>> searhAd(String token, String keySearch) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_search",
        data: {
          "search_key": keySearch,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////Ads filter///////////////////////////
  static Future<List<Ad>> adsFilter(
    String token,
    String cityID,
    String categoryId,
    String subCategoryID,
  ) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_filter",
        data: {
          if (cityID != "0") "city_id": cityID,
          if (categoryId != "0") "category_id": categoryId,
          if (subCategoryID != "0") "sub_category_id": subCategoryID,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        debugPrint("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ////////////////////////////ads_category_filter///////////////////////////
  static Future<Map<String, dynamic>> adCategoryFilter({
    required String token,
    required String categoryId,
    required String subCategoryID,
    required int pageNumber,
  }) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_category_filter?page=$pageNumber",
        data: {
          if (categoryId != "0") "category_id": categoryId,
          if (subCategoryID != "0") "sub_category_id": subCategoryID,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        return {
          "ads": ads,
          "next": response.data["data"]['next_page_url'].toString() == "null"
              ? false
              : true,
        };
      } else {
        return {};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  //////////////////////////// add comment ///////////////////////////
  static Future addComment({
    required String token,
    required String adId,
    required String comment,
  }) async {
    // Map<String, String> headers = {
    //   'Accept': 'application/json',
    //   'Authorization': "Bearer $token",
    // };
    // FormData formData = FormData.fromMap({
    //   'ad_id': adId,
    //   'comment': comment,
    // });
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(
        "${baseUrl}comment_ad",
        data: {
          'ad_id': adId,
          'comment': comment,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      log(response.toString());
      log(response.statusCode.toString());
      return response.data;
    } on DioError catch (e) {
      log(e.message);
      return "error";
    }
  }

  //////////////////////////// pay commission ///////////////////////////
  static Future payCommission({
    required String token,
    required double amount,
  }) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(
        "${baseUrl}pay_commission",
        data: {
          'amount': amount,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      return response.data['data']['payment_url'] ?? "error";
    } on DioError catch (e) {
      log(e.message);
      return "error";
    }
  }

  ////////////////////////////get conversations///////////////////////////
  static Future<List<ConversationModel>> getConverstion(
    int id,
    String token,
  ) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}conversations_messages/$id",
      );
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        List<ConversationModel> conversatoins = [];
        conversatoins = (response.data['data'] as List)
            .map((x) => ConversationModel.fromJson(x))
            .toList();
        debugPrint("number of messages Ads${conversatoins.length}");
        return conversatoins;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
