import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListStoryModel {
  final String status;
  final List<Data> data;
  ListStoryModel({
    required this.status,
    required this.data,
  });

  ListStoryModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ListStoryModel(
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

  factory ListStoryModel.fromMap(Map<String, dynamic> map) {
    return ListStoryModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListStoryModel.fromJson(String source) =>
      ListStoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListStoryModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListStoryModel &&
        other.status == status &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String username;
  final String profile_picture;
  Data({
    required this.username,
    required this.profile_picture,
  });

  Data copyWith({
    String? username,
    String? profile_picture,
  }) {
    return Data(
      username: username ?? this.username,
      profile_picture: profile_picture ?? this.profile_picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'profile_picture': profile_picture});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      username: map['username'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() =>
      'Data(username: $username, profile_picture: $profile_picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.username == username &&
        other.profile_picture == profile_picture;
  }

  @override
  int get hashCode => username.hashCode ^ profile_picture.hashCode;
}
