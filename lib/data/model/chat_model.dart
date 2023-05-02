import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChatModel {
  final String status;
  final List<Data> data;
  final Room_info room_info;
  ChatModel({
    required this.status,
    required this.data,
    required this.room_info,
  });

  ChatModel copyWith({
    String? status,
    List<Data>? data,
    Room_info? room_info,
  }) {
    return ChatModel(
      status: status ?? this.status,
      data: data ?? this.data,
      room_info: room_info ?? this.room_info,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});
    result.addAll({'room_info': room_info.toMap()});

    return result;
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      room_info: Room_info.fromMap(map['room_info']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatModel(status: $status, data: $data, room_info: $room_info)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.status == status &&
        listEquals(other.data, data) &&
        other.room_info == room_info;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ room_info.hashCode;
}

class Data {
  final String id;
  final String user_id;
  final String room_id;
  final String message;
  final String created_at;
  final String username;
  final String profile_picture;
  Data({
    required this.id,
    required this.user_id,
    required this.room_id,
    required this.message,
    required this.created_at,
    required this.username,
    required this.profile_picture,
  });

  Data copyWith({
    String? id,
    String? user_id,
    String? room_id,
    String? message,
    String? created_at,
    String? username,
    String? profile_picture,
  }) {
    return Data(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      room_id: room_id ?? this.room_id,
      message: message ?? this.message,
      created_at: created_at ?? this.created_at,
      username: username ?? this.username,
      profile_picture: profile_picture ?? this.profile_picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'user_id': user_id});
    result.addAll({'room_id': room_id});
    result.addAll({'message': message});
    result.addAll({'created_at': created_at});
    result.addAll({'username': username});
    result.addAll({'profile_picture': profile_picture});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      user_id: map['user_id'] ?? '',
      room_id: map['room_id'] ?? '',
      message: map['message'] ?? '',
      created_at: map['created_at'] ?? '',
      username: map['username'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, user_id: $user_id, room_id: $room_id, message: $message, created_at: $created_at, username: $username, profile_picture: $profile_picture)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.user_id == user_id &&
        other.room_id == room_id &&
        other.message == message &&
        other.created_at == created_at &&
        other.username == username &&
        other.profile_picture == profile_picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        room_id.hashCode ^
        message.hashCode ^
        created_at.hashCode ^
        username.hashCode ^
        profile_picture.hashCode;
  }
}

class Room_info {
  final String room_name;
  final String room_type;
  final String member_count;
  Room_info({
    required this.room_name,
    required this.room_type,
    required this.member_count,
  });

  Room_info copyWith({
    String? room_name,
    String? room_type,
    String? member_count,
  }) {
    return Room_info(
      room_name: room_name ?? this.room_name,
      room_type: room_type ?? this.room_type,
      member_count: member_count ?? this.member_count,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'room_name': room_name});
    result.addAll({'room_type': room_type});
    result.addAll({'member_count': member_count});

    return result;
  }

  factory Room_info.fromMap(Map<String, dynamic> map) {
    return Room_info(
      room_name: map['room_name'] ?? '',
      room_type: map['room_type'] ?? '',
      member_count: map['member_count'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Room_info.fromJson(String source) =>
      Room_info.fromMap(json.decode(source));

  @override
  String toString() =>
      'Room_info(room_name: $room_name, room_type: $room_type, member_count: $member_count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Room_info &&
        other.room_name == room_name &&
        other.room_type == room_type &&
        other.member_count == member_count;
  }

  @override
  int get hashCode =>
      room_name.hashCode ^ room_type.hashCode ^ member_count.hashCode;
}
