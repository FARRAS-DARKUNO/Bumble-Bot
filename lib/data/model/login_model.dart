import 'dart:convert';

class LoginModel {
  final String status;
  final String message;
  final User user;
  final String token;
  LoginModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  LoginModel copyWith({
    String? status,
    String? message,
    User? user,
    String? token,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'user': user.toMap()});
    result.addAll({'token': token});

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      user: User.fromMap(map['user']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginModel(status: $status, message: $message, user: $user, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.status == status &&
        other.message == message &&
        other.user == user &&
        other.token == token;
  }

  @override
  int get hashCode {
    return status.hashCode ^ message.hashCode ^ user.hashCode ^ token.hashCode;
  }
}

class User {
  final String id;
  final String email;
  final String password;
  final String google_uid;
  final String token;
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.google_uid,
    required this.token,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? google_uid,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      google_uid: google_uid ?? this.google_uid,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'google_uid': google_uid});
    result.addAll({'token': token});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      google_uid: map['google_uid'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, google_uid: $google_uid, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.password == password &&
        other.google_uid == google_uid &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        google_uid.hashCode ^
        token.hashCode;
  }
}
