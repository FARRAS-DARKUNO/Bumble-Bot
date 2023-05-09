import 'dart:convert';

class TokenBalanceModel {
  final String code;
  final String name;
  final String tokenAddress;
  final String symbol;
  final String decimal;
  final double amount;
  final String address;
  final String message;
  TokenBalanceModel({
    required this.code,
    required this.name,
    required this.tokenAddress,
    required this.symbol,
    required this.decimal,
    required this.amount,
    required this.address,
    required this.message,
  });

  TokenBalanceModel copyWith({
    String? code,
    String? name,
    String? tokenAddress,
    String? symbol,
    String? decimal,
    double? amount,
    String? address,
    String? message,
  }) {
    return TokenBalanceModel(
      code: code ?? this.code,
      name: name ?? this.name,
      tokenAddress: tokenAddress ?? this.tokenAddress,
      symbol: symbol ?? this.symbol,
      decimal: decimal ?? this.decimal,
      amount: amount ?? this.amount,
      address: address ?? this.address,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'name': name});
    result.addAll({'tokenAddress': tokenAddress});
    result.addAll({'symbol': symbol});
    result.addAll({'decimal': decimal});
    result.addAll({'amount': amount});
    result.addAll({'address': address});
    result.addAll({'message': message});

    return result;
  }

  factory TokenBalanceModel.fromMap(Map<String, dynamic> map) {
    return TokenBalanceModel(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      tokenAddress: map['tokenAddress'] ?? '',
      symbol: map['symbol'] ?? '',
      decimal: map['decimal'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenBalanceModel.fromJson(String source) =>
      TokenBalanceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TokenBalanceModel(code: $code, name: $name, tokenAddress: $tokenAddress, symbol: $symbol, decimal: $decimal, amount: $amount, address: $address, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenBalanceModel &&
        other.code == code &&
        other.name == name &&
        other.tokenAddress == tokenAddress &&
        other.symbol == symbol &&
        other.decimal == decimal &&
        other.amount == amount &&
        other.address == address &&
        other.message == message;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        tokenAddress.hashCode ^
        symbol.hashCode ^
        decimal.hashCode ^
        amount.hashCode ^
        address.hashCode ^
        message.hashCode;
  }
}
