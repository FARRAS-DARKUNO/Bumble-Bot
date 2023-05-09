import 'dart:convert';

class CointBalanceModel {
  final String code;
  final double account;
  final String message;
  CointBalanceModel({
    required this.code,
    required this.account,
    required this.message,
  });

  CointBalanceModel copyWith({
    String? code,
    double? account,
    String? message,
  }) {
    return CointBalanceModel(
      code: code ?? this.code,
      account: account ?? this.account,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'account': account});
    result.addAll({'message': message});

    return result;
  }

  factory CointBalanceModel.fromMap(Map<String, dynamic> map) {
    return CointBalanceModel(
      code: map['code'] ?? '',
      account: map['account']?.toDouble() ?? 0.0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CointBalanceModel.fromJson(String source) =>
      CointBalanceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CointBalanceModel(code: $code, account: $account, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CointBalanceModel &&
        other.code == code &&
        other.account == account &&
        other.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ account.hashCode ^ message.hashCode;
}
