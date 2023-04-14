import 'package:bumble_bot/data/model/login_model.dart';
import 'package:bumble_bot/data/model/status_message_model.dart';
import 'package:http/http.dart' as http;

import '../api/base_url.dart';

class IntroductionRepository {
  Future<StatusMessageModel> postRegserterGoogleRepo(
    String email,
    String googleUid,
  ) async {
    print(email);
    print(googleUid);
    final response = await http.post(
      Uri.parse('$baseUrl/register.php'),
      body: {"email": email, "google_uid": googleUid},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return StatusMessageModel.fromJson(response.body);
    } else {
      return StatusMessageModel.fromJson(response.body);
    }
  }

  Future<StatusMessageModel> postRegserterRepo(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {"email": email, "password": password},
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
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {"email": email, "google_uid": googleUid},
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
    print(email);
    print(password);
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );
    print(response);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return LoginModel.fromJson(response.body);
    } else {
      return LoginModel.fromJson(response.body);
    }
  }
}
