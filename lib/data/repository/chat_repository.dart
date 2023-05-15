import 'package:bumble_bot/data/api/base_url.dart';
import 'package:bumble_bot/data/model/chat_model.dart';
import 'package:bumble_bot/data/model/create_chat_room_model.dart';
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
        "${url}chatlist",
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
        "${url}chatambil",
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
        "${url}chatkirim",
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

  Future<CreateChatRoomModel> postMessagePersonal(
      String usernameAnother) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var username = pref.getString('Username') ?? '';
    FormData formdata = FormData.fromMap({
      "name": "$username & $usernameAnother",
      "type": "personal",
      "usernames": '["$username","$usernameAnother"]',
    });

    try {
      var response = await dio.post(
        "${url}chatroom",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return CreateChatRoomModel.fromMap(response.data);
    } catch (error) {
      var error = {"status": "Error", "message": "Error", "room_id": -1};

      return CreateChatRoomModel.fromMap(error);
    }
  }

  Future<CreateChatRoomModel> postMessageGroup(
    String listPersonal,
    String title,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    FormData formdata = FormData.fromMap({
      "name": title,
      "type": "group",
      "usernames": listPersonal,
    });

    try {
      var response = await dio.post(
        "${url}chatroom",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return CreateChatRoomModel.fromMap(response.data);
    } catch (_) {
      var error = {"status": "Error", "message": "Error", "room_id": -1};

      return CreateChatRoomModel.fromMap(error);
    }
  }

  Future<StatusMessageModel> postAddPeopleToGroup(
    String roomId,
    String username,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    FormData formdata = FormData.fromMap({
      "room_id": roomId,
      "username": username,
    });

    try {
      var response = await dio.post(
        "${url}chatundang",
        data: formdata,
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return StatusMessageModel.fromMap(response.data);
    } catch (_) {
      var error = {"status": "Error", "message": "Error"};

      return StatusMessageModel.fromMap(error);
    }
  }
}
