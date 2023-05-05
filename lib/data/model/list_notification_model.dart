import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListNotificationModel {
  final String status;
  final List<Data> data;
  ListNotificationModel({
    required this.status,
    required this.data,
  });

  ListNotificationModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ListNotificationModel(
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

  factory ListNotificationModel.fromMap(Map<String, dynamic> map) {
    return ListNotificationModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListNotificationModel.fromJson(String source) =>
      ListNotificationModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListNotificationModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListNotificationModel &&
        other.status == status &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String id;
  final String title;
  final String content;
  final String image;
  final String created_at;
  final String username;
  Data({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.created_at,
    required this.username,
  });

  Data copyWith({
    String? id,
    String? title,
    String? content,
    String? image,
    String? created_at,
    String? username,
  }) {
    return Data(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      created_at: created_at ?? this.created_at,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'image': image});
    result.addAll({'created_at': created_at});
    result.addAll({'username': username});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      image: map['image'] ?? '',
      created_at: map['created_at'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, title: $title, content: $content, image: $image, created_at: $created_at, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.image == image &&
        other.created_at == created_at &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        image.hashCode ^
        created_at.hashCode ^
        username.hashCode;
  }
}
