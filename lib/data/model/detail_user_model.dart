import 'dart:convert';

class DetailUserModel {
  final String status;
  final Data data;
  DetailUserModel({
    required this.status,
    required this.data,
  });

  DetailUserModel copyWith({
    String? status,
    Data? data,
  }) {
    return DetailUserModel(
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

  factory DetailUserModel.fromMap(Map<String, dynamic> map) {
    return DetailUserModel(
      status: map['status'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailUserModel.fromJson(String source) =>
      DetailUserModel.fromMap(json.decode(source));

  @override
  String toString() => 'DetailUserModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailUserModel &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String id;
  final String email;
  final String name;
  final String username;
  final String followers;
  final String following;
  final String profile_picture;
  final String wallet;
  final String created_at;
  final int isfollow;
  Data({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.followers,
    required this.following,
    required this.profile_picture,
    required this.wallet,
    required this.created_at,
    required this.isfollow,
  });

  Data copyWith({
    String? id,
    String? email,
    String? name,
    String? username,
    String? followers,
    String? following,
    String? profile_picture,
    String? wallet,
    String? created_at,
    int? isfollow,
  }) {
    return Data(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profile_picture: profile_picture ?? this.profile_picture,
      wallet: wallet ?? this.wallet,
      created_at: created_at ?? this.created_at,
      isfollow: isfollow ?? this.isfollow,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'username': username});
    result.addAll({'followers': followers});
    result.addAll({'following': following});
    result.addAll({'profile_picture': profile_picture});
    result.addAll({'wallet': wallet});
    result.addAll({'created_at': created_at});
    result.addAll({'isfollow': isfollow});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      followers: map['followers'] ?? '',
      following: map['following'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
      wallet: map['wallet'] ?? '',
      created_at: map['created_at'] ?? '',
      isfollow: map['isfollow']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, email: $email, name: $name, username: $username, followers: $followers, following: $following, profile_picture: $profile_picture, wallet: $wallet, created_at: $created_at, isfollow: $isfollow)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.username == username &&
        other.followers == followers &&
        other.following == following &&
        other.profile_picture == profile_picture &&
        other.wallet == wallet &&
        other.created_at == created_at &&
        other.isfollow == isfollow;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        username.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profile_picture.hashCode ^
        wallet.hashCode ^
        created_at.hashCode ^
        isfollow.hashCode;
  }
}
