import 'dart:io';

import 'package:bumble_bot/data/model/post_contain_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/status_message_model.dart';

class ContainRepository {
  var dio = Dio();

  Future<StatusMessageModel> postPost(
    String title,
    String caption,
    String hastag,
    String location,
    File image,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({
      "title": title,
      "caption": caption,
      "hashtag": hastag,
      "location": location,
      "image": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      )
    });

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/postartikel",
      data: formdata,
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
          "Content-Type": "multipart/form-data"
        },
      ),
    );

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return StatusMessageModel.fromMap(response.data);
    } else {
      Map<String, dynamic> error = {
        'status': "Terjadi Kesalah",
        'message': "Terdapat Kesalahan"
      };
      return StatusMessageModel.fromMap(error);
    }
  }

  Future<List<PostContainModel>> getContainPost(int page) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/get_posts?page=$page",
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
        },
      ),
    );

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      final List result = response.data["data"];
      return result.map((value) => PostContainModel.fromMap(value)).toList();
    } else {
      var error = [];
      return error.map((value) => PostContainModel.fromMap(value)).toList();
    }
  }

  Future<PostContainModel> getDetailContainPost(String id) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/detail_post?id=$id",
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
        },
      ),
    );

    return PostContainModel.fromMap(response.data["data"]);
  }
}
