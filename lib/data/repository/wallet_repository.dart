import 'dart:convert';

import 'package:bumble_bot/data/model/list_token_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletRepository {
  var dio = Dio();

  Future getDetailToken(String tokenWallet) async {
    Map formdata = {
      "tokenAddress": tokenWallet,
      "evm": "bsc",
      "endpoint": "https://bsc.rpc.blxrbdn.com"
    };
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "http://103.190.29.199:1000/cektoken",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            // 'Authorization': "Bearer $token",
            'Content-Type': 'application/json',
            'x-token': 'SisiTeknis'
          },
        ),
      );

      return response.data;
    } catch (_) {
      Map<String, dynamic> error = {
        'code': '',
        'name': '',
        'symbol': '',
        'decimals': '',
        'totalSupply': '',
        'owner': '',
        'tokens': [],
        'message': 'error',
      };
      return error;
    }
  }

  Future<ListTokenModel> getListToken() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.get(
        "https://sisiteknis.com/bumblebot/tokenlist",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ListTokenModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {'status': "error", 'data': []};
      return ListTokenModel.fromMap(error);
    }
  }

  Future<ListTokenModel> getListTokenMore() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('Token') ?? '';

    try {
      var response = await dio.get(
        "https://sisiteknis.com/bumblebot/tokenlist100",
        options: Options(
          headers: {
            "accept": "*/*",
            'Authorization': "Bearer $token",
          },
        ),
      );
      return ListTokenModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {'status': "error", 'data': []};
      return ListTokenModel.fromMap(error);
    }
  }
}
