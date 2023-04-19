import 'dart:convert';

import 'package:bumble_bot/data/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/base_url.dart';
import '../model/status_message_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfileRepo() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var email = pref.getString('Email') ?? '';
    var url = Uri.https(baseUrl, 'bumblebot/lihatprofile');
    Map data = {"email": email};
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token",
        },
        body: body);

    return ProfileModel.fromJson(response.body);
  }

  Future<StatusMessageModel> postEditProfile(
    String name,
    String numberPhone,
    String profilePicture,
    String password,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var url = Uri.https(baseUrl, 'bumblebot/lihatprofile');
    Map data = {
      "name": name,
      "phone_number": numberPhone,
      "profile_picture": profilePicture,
      "password": password
    };
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token",
        },
        body: body);

    return StatusMessageModel.fromJson(response.body);
  }
}
