import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListFollowModel {
  final String status;
  final List<Data> data;
  ListFollowModel({
    required this.status,
    required this.data,
  });

  ListFollowModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ListFollowModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ListFollowModel.fromMap(Map<String, dynamic> map) {
    return ListFollowModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListFollowModel.fromJson(String source) =>
      ListFollowModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListFollowModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListFollowModel &&
        other.status == status &&
        listEquals(other.data, data);
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, email: $email, name: $name, username: $username, followers: $followers, following: $following, profile_picture: $profile_picture, wallet: $wallet, created_at: $created_at)';
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
        other.created_at == created_at;
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
        created_at.hashCode;
  }
}
