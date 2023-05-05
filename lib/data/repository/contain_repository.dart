import 'dart:io';

import 'package:bumble_bot/data/model/detail_story_model.dart';
import 'package:bumble_bot/data/model/list_stoty_model.dart';
import 'package:bumble_bot/data/model/post_contain_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/detail_post_model.dart';
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

  Future<DetailPostModel> getDetailContainPost(String id) async {
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

    return DetailPostModel.fromMap(response.data["data"]);
  }

  Future<StatusMessageModel> postFollow(
    String username,
    String action,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({
      "username": username,
      "action": action,
    });

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/followunfollow",
      data: formdata,
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
          "Content-Type": "multipart/form-data"
        },
      ),
    );

    return StatusMessageModel.fromMap(response.data);
  }

  Future<StatusMessageModel> postLike(
    String postid,
    String action,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({
      "post_id": postid,
      "action": action,
    });

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/likedislike",
      data: formdata,
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
          "Content-Type": "multipart/form-data"
        },
      ),
    );

    return StatusMessageModel.fromMap(response.data);
  }

  Future<StatusMessageModel> postComment(
    String postId,
    String komentar,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({
      "post_id": postId,
      "komentar": komentar,
    });

    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/komentar",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      return StatusMessageModel.fromMap(response.data);
    } catch (_) {
      var error = {"status": "error", "message": "jangan Spam"};
      return StatusMessageModel.fromMap(error);
    }
  }

  Future<StatusMessageModel> postStory(String caption, File image) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({
      "caption": caption,
      "image": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      )
    });
    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/poststory",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      return StatusMessageModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        'status': "Terjadi Kesalah",
        'message': "Terdapat Kesalahan"
      };
      return StatusMessageModel.fromMap(error);
    }
  }

  Future<ListStoryModel> getListStory() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.get(
        "https://sisiteknis.com/bumblebot/get_list_story_today",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ListStoryModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {'status': "error", 'data': []};
      return ListStoryModel.fromMap(error);
    }
  }

  Future<DetailStoryModel> getDetailStory(String username) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.get(
        "https://sisiteknis.com/bumblebot/get_story?username=$username",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return DetailStoryModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {'status': "error", 'data': []};
      return DetailStoryModel.fromMap(error);
    }
  }
}
