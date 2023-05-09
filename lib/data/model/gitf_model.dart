import 'dart:convert';

class GiftModel {
  final String code;
  final String from;
  final String to;
  final String amount;
  final String hash;
  final String message;
  GiftModel({
    required this.code,
    required this.from,
    required this.to,
    required this.amount,
    required this.hash,
    required this.message,
  });

  GiftModel copyWith({
    String? code,
    String? from,
    String? to,
    String? amount,
    String? hash,
    String? message,
  }) {
    return GiftModel(
      code: code ?? this.code,
      from: from ?? this.from,
      to: to ?? this.to,
      amount: amount ?? this.amount,
      hash: hash ?? this.hash,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'from': from});
    result.addAll({'to': to});
    result.addAll({'amount': amount});
    result.addAll({'hash': hash});
    result.addAll({'message': message});

    return result;
  }

  factory GiftModel.fromMap(Map<String, dynamic> map) {
    return GiftModel(
      code: map['code'] ?? '',
      from: map['from'] ?? '',
      to: map['to'] ?? '',
      amount: map['amount'] ?? '',
      hash: map['hash'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GiftModel.fromJson(String source) =>
      GiftModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GiftModel(code: $code, from: $from, to: $to, amount: $amount, hash: $hash, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GiftModel &&
        other.code == code &&
        other.from == from &&
        other.to == to &&
        other.amount == amount &&
        other.hash == hash &&
        other.message == message;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        from.hashCode ^
        to.hashCode ^
        amount.hashCode ^
        hash.hashCode ^
        message.hashCode;
  }
}
