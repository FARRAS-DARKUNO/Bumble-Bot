import 'dart:convert';

class LoginModel {
  final String status;
  final String message;
  final String token;
  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  LoginModel copyWith({
    String? status,
    String? message,
    String? token,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'token': token});

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginModel(status: $status, message: $message, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.status == status &&
        other.message == message &&
        other.token == token;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ token.hashCode;
}
