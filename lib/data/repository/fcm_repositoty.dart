import 'package:bumble_bot/data/model/status_message_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMRepository {
  var dio = Dio();
  Future<StatusMessageModel> updateFCMRepo(String tokenFCM) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    FormData formdata = FormData.fromMap({"fcmToken": tokenFCM});

    var response = await dio.post(
      'https://sisiteknis.com/bumblebot/updatefcm',
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
}
