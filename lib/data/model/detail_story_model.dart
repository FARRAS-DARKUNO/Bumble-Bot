import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailStoryModel {
  final String status;
  final List<Data> data;
  DetailStoryModel({
    required this.status,
    required this.data,
  });

  DetailStoryModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return DetailStoryModel(
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

  factory DetailStoryModel.fromMap(Map<String, dynamic> map) {
    return DetailStoryModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailStoryModel.fromJson(String source) =>
      DetailStoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'DetailStoryModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailStoryModel &&
        other.status == status &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final int id;
  final String username;
  final int userid;
  final String name;
  final String profile_picture;
  final String type;
  final String image;
  final String caption;
  final String created_at;
  final String typefile;
  final int isfollow;
  final int islike;
  Data({
    required this.id,
    required this.username,
    required this.userid,
    required this.name,
    required this.profile_picture,
    required this.type,
    required this.image,
    required this.caption,
    required this.created_at,
    required this.typefile,
    required this.isfollow,
    required this.islike,
  });

  Data copyWith({
    int? id,
    String? username,
    int? userid,
    String? name,
    String? profile_picture,
    String? type,
    String? image,
    String? caption,
    String? created_at,
    String? typefile,
    int? isfollow,
    int? islike,
  }) {
    return Data(
      id: id ?? this.id,
      username: username ?? this.username,
      userid: userid ?? this.userid,
      name: name ?? this.name,
      profile_picture: profile_picture ?? this.profile_picture,
      type: type ?? this.type,
      image: image ?? this.image,
      caption: caption ?? this.caption,
      created_at: created_at ?? this.created_at,
      typefile: typefile ?? this.typefile,
      isfollow: isfollow ?? this.isfollow,
      islike: islike ?? this.islike,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'username': username});
    result.addAll({'userid': userid});
    result.addAll({'name': name});
    result.addAll({'profile_picture': profile_picture});
    result.addAll({'type': type});
    result.addAll({'image': image});
    result.addAll({'caption': caption});
    result.addAll({'created_at': created_at});
    result.addAll({'typefile': typefile});
    result.addAll({'isfollow': isfollow});
    result.addAll({'islike': islike});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      userid: map['userid']?.toInt() ?? 0,
      name: map['name'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
      caption: map['caption'] ?? '',
      created_at: map['created_at'] ?? '',
      typefile: map['typefile'] ?? '',
      isfollow: map['isfollow']?.toInt() ?? 0,
      islike: map['islike']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, username: $username, userid: $userid, name: $name, profile_picture: $profile_picture, type: $type, image: $image, caption: $caption, created_at: $created_at, typefile: $typefile, isfollow: $isfollow, islike: $islike)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.username == username &&
        other.userid == userid &&
        other.name == name &&
        other.profile_picture == profile_picture &&
        other.type == type &&
        other.image == image &&
        other.caption == caption &&
        other.created_at == created_at &&
        other.typefile == typefile &&
        other.isfollow == isfollow &&
        other.islike == islike;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        userid.hashCode ^
        name.hashCode ^
        profile_picture.hashCode ^
        type.hashCode ^
        image.hashCode ^
        caption.hashCode ^
        created_at.hashCode ^
        typefile.hashCode ^
        isfollow.hashCode ^
        islike.hashCode;
  }
}
