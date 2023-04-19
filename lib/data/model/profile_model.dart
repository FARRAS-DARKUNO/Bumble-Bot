import 'dart:convert';

class ProfileModel {
  final String status;
  final Data data;
  ProfileModel({
    required this.status,
    required this.data,
  });

  ProfileModel copyWith({
    String? status,
    Data? data,
  }) {
    return ProfileModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'data': data.toMap()});

    return result;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      status: map['status'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String email;
  final String name;
  final String username;
  final String phone_number;
  final String profile_picture;
  final String wallet;
  final String created_at;
  Data({
    required this.email,
    required this.name,
    required this.username,
    required this.phone_number,
    required this.profile_picture,
    required this.wallet,
    required this.created_at,
  });

  Data copyWith({
    String? email,
    String? name,
    String? username,
    String? phone_number,
    String? profile_picture,
    String? wallet,
    String? created_at,
  }) {
    return Data(
      email: email ?? this.email,
      name: name ?? this.name,
      username: username ?? this.username,
      phone_number: phone_number ?? this.phone_number,
      profile_picture: profile_picture ?? this.profile_picture,
      wallet: wallet ?? this.wallet,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'username': username});
    result.addAll({'phone_number': phone_number});
    result.addAll({'profile_picture': profile_picture});
    result.addAll({'wallet': wallet});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      phone_number: map['phone_number'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
      wallet: map['wallet'] ?? '',
      created_at: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(email: $email, name: $name, username: $username, phone_number: $phone_number, profile_picture: $profile_picture, wallet: $wallet, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.email == email &&
        other.name == name &&
        other.username == username &&
        other.phone_number == phone_number &&
        other.profile_picture == profile_picture &&
        other.wallet == wallet &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        username.hashCode ^
        phone_number.hashCode ^
        profile_picture.hashCode ^
        wallet.hashCode ^
        created_at.hashCode;
  }
}
