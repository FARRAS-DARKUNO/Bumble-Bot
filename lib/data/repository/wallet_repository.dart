import 'dart:convert';

import 'package:bumble_bot/data/model/coint_balance_model.dart';
import 'package:bumble_bot/data/model/list_token_model.dart';
import 'package:bumble_bot/data/model/token_balance_model.dart';
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

  Future<CointBalanceModel> getCointBalance() async {
    final pref = await SharedPreferences.getInstance();
    var wallet = pref.getString('Wallet') ?? '';
    Map formdata = {
      "wallet": wallet,
      "evm": "bsc",
      "endpoint": "https://bsc.rpc.blxrbdn.com"
    };
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "http://103.190.29.199:1000/amount",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            'Content-Type': 'application/json',
            'x-token': 'SisiTeknis'
          },
        ),
      );

      return CointBalanceModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        "code": "error",
        "account": 0,
        "message": "error"
      };
      return CointBalanceModel.fromMap(error);
    }
  }

  Future<TokenBalanceModel> getTokenBalance() async {
    final pref = await SharedPreferences.getInstance();
    var wallet = pref.getString('Wallet') ?? '';
    Map formdata = {
      "wallet": wallet,
      "sc": "0x42a7da71a6b553d20ac656cc33540ac784e68072",
      "endpoint": "https://bsc.rpc.blxrbdn.com",
      "evm": "bsc"
    };
    var body = json.encode(formdata);

    try {
      var response = await dio.post(
        "http://103.190.29.199:1000/amounttoken",
        data: body,
        options: Options(
          headers: {
            "accept": "*/*",
            'Content-Type': 'application/json',
            'x-token': 'SisiTeknis'
          },
        ),
      );

      return TokenBalanceModel.fromMap(response.data);
    } catch (_) {
      Map<String, dynamic> error = {
        "code": "-1",
        "name": "error",
        "tokenAddress": "",
        "symbol": "",
        "decimal": "",
        "amount": 0,
        "address": "",
        "message": "error"
      };
      return TokenBalanceModel.fromMap(error);
    }
  }
}
