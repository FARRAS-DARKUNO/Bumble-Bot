import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class DetailTokenModel {
  final String code;
  final String name;
  final String symbol;
  final String decimals;
  final String totalSupply;
  final String owner;
  final List<Token> tokens;
  final String message;
  DetailTokenModel({
    required this.code,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.totalSupply,
    required this.owner,
    required this.tokens,
    required this.message,
  });

  DetailTokenModel copyWith({
    String? code,
    String? name,
    String? symbol,
    String? decimals,
    String? totalSupply,
    String? owner,
    List<Token>? tokens,
    String? message,
  }) {
    return DetailTokenModel(
      code: code ?? this.code,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      totalSupply: totalSupply ?? this.totalSupply,
      owner: owner ?? this.owner,
      tokens: tokens ?? this.tokens,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'name': name});
    result.addAll({'symbol': symbol});
    result.addAll({'decimals': decimals});
    result.addAll({'totalSupply': totalSupply});
    result.addAll({'owner': owner});
    result.addAll({'tokens': tokens.map((x) => x.toMap()).toList()});
    result.addAll({'message': message});

    return result;
  }

  factory DetailTokenModel.fromMap(Map<String, dynamic> map) {
    return DetailTokenModel(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      decimals: map['decimals'] ?? '',
      totalSupply: map['totalSupply'] ?? '',
      owner: map['owner'] ?? '',
      tokens: List<Token>.from(map['tokens']?.map((x) => Token.fromMap(x))),
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailTokenModel.fromJson(String source) =>
      DetailTokenModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailTokenModel(code: $code, name: $name, symbol: $symbol, decimals: $decimals, totalSupply: $totalSupply, owner: $owner, tokens: $tokens, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is DetailTokenModel &&
        other.code == code &&
        other.name == name &&
        other.symbol == symbol &&
        other.decimals == decimals &&
        other.totalSupply == totalSupply &&
        other.owner == owner &&
        listEquals(other.tokens, tokens) &&
        other.message == message;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        symbol.hashCode ^
        decimals.hashCode ^
        totalSupply.hashCode ^
        owner.hashCode ^
        tokens.hashCode ^
        message.hashCode;
  }
}

class Token {
  final int contract_decimals;
  final String contract_name;
  final String contract_ticker_symbol;
  final String contract_address;
  final List<String> supports_erc;
  final String logo_url;
  final String last_transferred_at;
  final bool native_token;
  final String type;
  final String balance;
  final String balance_24h;
  final double quote_rate;
  final double quote_rate_24h;
  final int quote;
  final String pretty_quote;
  final int quote_24h;
  final String pretty_quote_24h;
  final List<String> nft_data;
  Token({
    required this.contract_decimals,
    required this.contract_name,
    required this.contract_ticker_symbol,
    required this.contract_address,
    required this.supports_erc,
    required this.logo_url,
    required this.last_transferred_at,
    required this.native_token,
    required this.type,
    required this.balance,
    required this.balance_24h,
    required this.quote_rate,
    required this.quote_rate_24h,
    required this.quote,
    required this.pretty_quote,
    required this.quote_24h,
    required this.pretty_quote_24h,
    required this.nft_data,
  });

  Token copyWith({
    int? contract_decimals,
    String? contract_name,
    String? contract_ticker_symbol,
    String? contract_address,
    List<String>? supports_erc,
    String? logo_url,
    String? last_transferred_at,
    bool? native_token,
    String? type,
    String? balance,
    String? balance_24h,
    double? quote_rate,
    double? quote_rate_24h,
    int? quote,
    String? pretty_quote,
    int? quote_24h,
    String? pretty_quote_24h,
    List<String>? nft_data,
  }) {
    return Token(
      contract_decimals: contract_decimals ?? this.contract_decimals,
      contract_name: contract_name ?? this.contract_name,
      contract_ticker_symbol:
          contract_ticker_symbol ?? this.contract_ticker_symbol,
      contract_address: contract_address ?? this.contract_address,
      supports_erc: supports_erc ?? this.supports_erc,
      logo_url: logo_url ?? this.logo_url,
      last_transferred_at: last_transferred_at ?? this.last_transferred_at,
      native_token: native_token ?? this.native_token,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      balance_24h: balance_24h ?? this.balance_24h,
      quote_rate: quote_rate ?? this.quote_rate,
      quote_rate_24h: quote_rate_24h ?? this.quote_rate_24h,
      quote: quote ?? this.quote,
      pretty_quote: pretty_quote ?? this.pretty_quote,
      quote_24h: quote_24h ?? this.quote_24h,
      pretty_quote_24h: pretty_quote_24h ?? this.pretty_quote_24h,
      nft_data: nft_data ?? this.nft_data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'contract_decimals': contract_decimals});
    result.addAll({'contract_name': contract_name});
    result.addAll({'contract_ticker_symbol': contract_ticker_symbol});
    result.addAll({'contract_address': contract_address});
    result.addAll({'supports_erc': supports_erc});
    result.addAll({'logo_url': logo_url});
    result.addAll({'last_transferred_at': last_transferred_at});
    result.addAll({'native_token': native_token});
    result.addAll({'type': type});
    result.addAll({'balance': balance});
    result.addAll({'balance_24h': balance_24h});
    result.addAll({'quote_rate': quote_rate});
    result.addAll({'quote_rate_24h': quote_rate_24h});
    result.addAll({'quote': quote});
    result.addAll({'pretty_quote': pretty_quote});
    result.addAll({'quote_24h': quote_24h});
    result.addAll({'pretty_quote_24h': pretty_quote_24h});
    result.addAll({'nft_data': nft_data});

    return result;
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      contract_decimals: map['contract_decimals']?.toInt() ?? 0,
      contract_name: map['contract_name'] ?? '',
      contract_ticker_symbol: map['contract_ticker_symbol'] ?? '',
      contract_address: map['contract_address'] ?? '',
      supports_erc: List<String>.from(map['supports_erc']),
      logo_url: map['logo_url'] ?? '',
      last_transferred_at: map['last_transferred_at'] ?? '',
      native_token: map['native_token'] ?? false,
      type: map['type'] ?? '',
      balance: map['balance'] ?? '',
      balance_24h: map['balance_24h'] ?? '',
      quote_rate: map['quote_rate']?.toDouble() ?? 0.0,
      quote_rate_24h: map['quote_rate_24h']?.toDouble() ?? 0.0,
      quote: map['quote']?.toInt() ?? 0,
      pretty_quote: map['pretty_quote'] ?? '',
      quote_24h: map['quote_24h']?.toInt() ?? 0,
      pretty_quote_24h: map['pretty_quote_24h'] ?? '',
      nft_data: List<String>.from(map['nft_data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Token(contract_decimals: $contract_decimals, contract_name: $contract_name, contract_ticker_symbol: $contract_ticker_symbol, contract_address: $contract_address, supports_erc: $supports_erc, logo_url: $logo_url, last_transferred_at: $last_transferred_at, native_token: $native_token, type: $type, balance: $balance, balance_24h: $balance_24h, quote_rate: $quote_rate, quote_rate_24h: $quote_rate_24h, quote: $quote, pretty_quote: $pretty_quote, quote_24h: $quote_24h, pretty_quote_24h: $pretty_quote_24h, nft_data: $nft_data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Token &&
        other.contract_decimals == contract_decimals &&
        other.contract_name == contract_name &&
        other.contract_ticker_symbol == contract_ticker_symbol &&
        other.contract_address == contract_address &&
        listEquals(other.supports_erc, supports_erc) &&
        other.logo_url == logo_url &&
        other.last_transferred_at == last_transferred_at &&
        other.native_token == native_token &&
        other.type == type &&
        other.balance == balance &&
        other.balance_24h == balance_24h &&
        other.quote_rate == quote_rate &&
        other.quote_rate_24h == quote_rate_24h &&
        other.quote == quote &&
        other.pretty_quote == pretty_quote &&
        other.quote_24h == quote_24h &&
        other.pretty_quote_24h == pretty_quote_24h &&
        listEquals(other.nft_data, nft_data);
  }

  @override
  int get hashCode {
    return contract_decimals.hashCode ^
        contract_name.hashCode ^
        contract_ticker_symbol.hashCode ^
        contract_address.hashCode ^
        supports_erc.hashCode ^
        logo_url.hashCode ^
        last_transferred_at.hashCode ^
        native_token.hashCode ^
        type.hashCode ^
        balance.hashCode ^
        balance_24h.hashCode ^
        quote_rate.hashCode ^
        quote_rate_24h.hashCode ^
        quote.hashCode ^
        pretty_quote.hashCode ^
        quote_24h.hashCode ^
        pretty_quote_24h.hashCode ^
        nft_data.hashCode;
  }
}
