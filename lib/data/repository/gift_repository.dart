import 'dart:convert';

import 'package:bumble_bot/data/model/gitf_model.dart';
import 'package:bumble_bot/data/model/pk_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftReposotory {
  var dio = Dio();

  Future<PKMModel> getPrivateKey() async {
    final pref = await SharedPreferences.getInstance();
    var email = pref.getString('Email') ?? '';
    var token = pref.getString('Token') ?? '';

    Map formdata = {"email": email};
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "https://sisiteknis.com/bumblebot/getpk",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );

      return PKMModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        "status": "error",
        "data": {"email": "", "private_key": ""}
      };
      return PKMModel.fromMap(error);
    }
  }

  Future<GiftModel> postGiftCoint(
    String privateKey,
    String to,
    String value,
  ) async {
    Map formdata = {
      "to": to,
      "privatekey": privateKey,
      "value": value,
      "gasprice": "5",
      "gaslimit": "21000",
      "endpoint": "https://bsc.rpc.blxrbdn.com",
      "evm": "bsc"
    };
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "http://103.190.29.199:1000/sendcoin",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            'Content-Type': 'application/json',
            'x-token': "SisiTeknis",
          },
        ),
      );

      return GiftModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        "code": "",
        "from": "",
        "to": "",
        "amount": "",
        "hash": "",
        "message": "error"
      };
      return GiftModel.fromMap(error);
    }
  }

  Future<GiftModel> postGiftToken(
    String privateKey,
    String to,
    String value,
  ) async {
    Map formdata = {
      "privatekey": privateKey,
      "sctoken": "0x42a7da71a6b553d20ac656cc33540ac784e68072",
      "to": to,
      "value": value,
      "gasprice": "5",
      "gaslimit": "300000",
      "endpoint": "https://bsc.rpc.blxrbdn.com",
      "evm": "bsc"
    };
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "http://103.190.29.199:1000/sendtoken",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            'Content-Type': 'application/json',
            'x-token': "SisiTeknis",
          },
        ),
      );

      return GiftModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        "code": "",
        "from": "",
        "to": "",
        "amount": "",
        "hash": "",
        "message": "error"
      };
      return GiftModel.fromMap(error);
    }
  }
}
