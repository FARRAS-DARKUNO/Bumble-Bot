import 'dart:convert';
import 'dart:io';
import 'package:bumble_bot/data/model/detail_user_model.dart';
import 'package:bumble_bot/data/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api/base_url.dart';
import '../model/status_message_model.dart';

class ProfileRepository {
  var dio = Dio();
  Future<ProfileModel> getProfileRepo() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var email = pref.getString('Email') ?? '';
    var url = Uri.https(baseUrl, 'bumblebot/lihatprofile');
    Map data = {"email": email};
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer $token",
      },
      body: body,
    );

    return ProfileModel.fromJson(response.body);
  }

  Future<StatusMessageModel> postEditProfile(
    String? name,
    String? numberPhone,
    File? profilePicture,
    String? password,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';
    var email = pref.getString('Email') ?? '';

    FormData formdata = FormData.fromMap({
      "email": email,
      "name": name,
      "phone_number": numberPhone,
      "password": password,
      "profile_picture": profilePicture != null
          ? await MultipartFile.fromFile(
              profilePicture.path,
              filename: profilePicture.path.split('/').last,
            )
          : null
    });

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/updateprofil",
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

  Future<DetailUserModel> getUserDataRepo(String username) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    Map formdata = {"username": username};
    var body = jsonEncode(formdata);

    var response = await dio.post(
      "https://sisiteknis.com/bumblebot/lihatuser",
      data: body,
      options: Options(
        headers: {
          "accept": "*/*",
          'Authorization': "Bearer $token",
        },
      ),
    );
    return DetailUserModel.fromMap(response.data);
  }
}
