import 'package:bumble_bot/data/model/list_follow_model.dart';
import 'package:bumble_bot/data/model/list_user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/base_url.dart';

class UserRepositoty {
  var dio = Dio();

  Future<List<ListUserModel>> postListUser(String name) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({"user_name": name});

    try {
      var response = await dio.post(
        "${url}cariuser",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      final List result = response.data['data'];
      return result.map((value) => ListUserModel.fromMap(value)).toList();
    } catch (_) {
      var error = [];
      return error.map((value) => ListUserModel.fromMap(value)).toList();
    }
  }

  Future<ListFollowModel> postListFollower(String username) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({"username": username});

    try {
      var response = await dio.post(
        "${url}follower",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );

      return ListFollowModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {"status": "error", "data": []};
      return ListFollowModel.fromMap(error);
    }
  }

  Future<ListFollowModel> postListFollowing(String username) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({"username": username});

    try {
      var response = await dio.post(
        "${url}following",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );

      return ListFollowModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {"status": "error", "data": []};
      return ListFollowModel.fromMap(error);
    }
  }
}
