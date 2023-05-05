import 'package:bumble_bot/data/model/list_notification_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepository {
  var dio = Dio();
  Future<ListNotificationModel> getNotification() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.get(
        "https://sisiteknis.com/bumblebot/lihat_news",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ListNotificationModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {'status': "error", 'data': []};
      return ListNotificationModel.fromMap(error);
    }
  }
}
