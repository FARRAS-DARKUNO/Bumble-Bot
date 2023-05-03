import 'package:bumble_bot/data/model/list_user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoty {
  var dio = Dio();

  Future<List<ListUserModel>> postListUser(String name) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var username = pref.getString('Username') ?? '';

    FormData formdata = FormData.fromMap({"user_name": name});

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/cariuser",
      data: formdata,
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
        },
      ),
    );

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      final List result = response.data['data'];
      return result.map((value) => ListUserModel.fromMap(value)).toList();
    } else {
      var error = [];
      return error.map((value) => ListUserModel.fromMap(value)).toList();
    }
  }
}
