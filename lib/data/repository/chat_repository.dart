import 'dart:math';

import 'package:bumble_bot/data/model/chat_model.dart';
import 'package:bumble_bot/data/model/list_chat_model.dart';
import 'package:bumble_bot/data/model/status_message_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRepository {
  var dio = Dio();

  Future<ListChatModel> getListChat() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/chatlist",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ListChatModel.fromMap(response.data);
    } catch (error) {
      var error = {"status": "error", "data": []};
      return ListChatModel.fromMap(error);
    }
  }

  Future<ChatModel> getChat(String id) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    FormData formdata = FormData.fromMap({"room_id": id});
    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/chatambil",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ChatModel.fromMap(response.data);
    } catch (error) {
      var error = {
        "status": "error",
        "data": [],
        "room_info": {
          "room_name": "Ada Yang salah",
          "room_type": "personal",
          "member_count": "2"
        }
      };
      return ChatModel.fromMap(error);
    }
  }

  Future<StatusMessageModel> postMessage(String idRoom, String message) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    FormData formdata = FormData.fromMap({
      "room_id": idRoom,
      "message": message,
    });
    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/chatkirim",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return StatusMessageModel.fromMap(response.data);
    } catch (error) {
      var error = {"status": "Error", "message": "Error"};
      return StatusMessageModel.fromMap(error);
    }
  }
}
