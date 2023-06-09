import 'dart:convert';

import 'package:bumble_bot/data/model/login_model.dart';
import 'package:bumble_bot/data/model/status_message_model.dart';
import 'package:http/http.dart' as http;

import '../api/base_url.dart';

class IntroductionRepository {
  Future<StatusMessageModel> postRegserterGoogleRepo(
    String email,
    String googleUid,
    String profilePicture,
  ) async {
    var url = Uri.https(baseUrl, 'bumblebot/register');

    Map data = {
      "email": email,
      "google_uid": googleUid,
      "profile_picture": profilePicture
    };
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return StatusMessageModel.fromJson(response.body);
    } else {
      return StatusMessageModel.fromJson(response.body);
    }
  }

  Future<StatusMessageModel> postRegserterRepo(String email, String password,
      String name, String username, String phoneNumber) async {
    var url = Uri.https(baseUrl, 'bumblebot/register');
    Map data = {
      "email": email,
      "password": password,
      "google_uid": "",
      "name": name,
      "username": username,
      "phone_number": phoneNumber
    };
    var body = json.encode(data);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return StatusMessageModel.fromJson(response.body);
    } else {
      return StatusMessageModel.fromJson(response.body);
    }
  }

  Future<LoginModel> postLoginGoogleRepo(
    String email,
    String googleUid,
  ) async {
    var url = Uri.https(baseUrl, 'bumblebot/login');
    Map data = {"email": email, "google_uid": googleUid};
    var body = json.encode(data);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return LoginModel.fromJson(response.body);
    } else {
      return LoginModel.fromJson(response.body);
    }
  }

  Future<LoginModel> postLoginRepo(
    String email,
    String password,
  ) async {
    var url = Uri.https(baseUrl, 'bumblebot/login');
    Map data = {'email': email, 'password': password};
    var body = json.encode(data);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return LoginModel.fromJson(response.body);
    } else {
      return LoginModel.fromJson(response.body);
    }
  }
}
