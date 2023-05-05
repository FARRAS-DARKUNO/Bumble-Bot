import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailPostModel {
  final String id;
  final String username;
  final String userid;
  final String name;
  final String profile_picture;
  final String type;
  final String title;
  final String image;
  final String caption;
  final String hashtag;
  final String location;
  final String created_at;
  final String history;
  final String likes;
  final String dislikes;
  final String typefile;
  final int isfollow;
  final int islike;
  final List<Komentar> komentar;
  DetailPostModel({
    required this.id,
    required this.username,
    required this.userid,
    required this.name,
    required this.profile_picture,
    required this.type,
    required this.title,
    required this.image,
    required this.caption,
    required this.hashtag,
    required this.location,
    required this.created_at,
    required this.history,
    required this.likes,
    required this.dislikes,
    required this.typefile,
    required this.isfollow,
    required this.islike,
    required this.komentar,
  });

  DetailPostModel copyWith({
    String? id,
    String? username,
    String? userid,
    String? name,
    String? profile_picture,
    String? type,
    String? title,
    String? image,
    String? caption,
    String? hashtag,
    String? location,
    String? created_at,
    String? history,
    String? likes,
    String? dislikes,
    String? typefile,
    int? isfollow,
    int? islike,
    List<Komentar>? komentar,
  }) {
    return DetailPostModel(
      id: id ?? this.id,
      username: username ?? this.username,
      userid: userid ?? this.userid,
      name: name ?? this.name,
      profile_picture: profile_picture ?? this.profile_picture,
      type: type ?? this.type,
      title: title ?? this.title,
      image: image ?? this.image,
      caption: caption ?? this.caption,
      hashtag: hashtag ?? this.hashtag,
      location: location ?? this.location,
      created_at: created_at ?? this.created_at,
      history: history ?? this.history,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      typefile: typefile ?? this.typefile,
      isfollow: isfollow ?? this.isfollow,
      islike: islike ?? this.islike,
      komentar: komentar ?? this.komentar,
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
    result.addAll({'title': title});
    result.addAll({'image': image});
    result.addAll({'caption': caption});
    result.addAll({'hashtag': hashtag});
    result.addAll({'location': location});
    result.addAll({'created_at': created_at});
    result.addAll({'history': history});
    result.addAll({'likes': likes});
    result.addAll({'dislikes': dislikes});
    result.addAll({'typefile': typefile});
    result.addAll({'isfollow': isfollow});
    result.addAll({'islike': islike});
    result.addAll({'komentar': komentar.map((x) => x.toMap()).toList()});

    return result;
  }

  factory DetailPostModel.fromMap(Map<String, dynamic> map) {
    return DetailPostModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      userid: map['userid'] ?? '',
      name: map['name'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      caption: map['caption'] ?? '',
      hashtag: map['hashtag'] ?? '',
      location: map['location'] ?? '',
      created_at: map['created_at'] ?? '',
      history: map['history'] ?? '',
      likes: map['likes'] ?? '',
      dislikes: map['dislikes'] ?? '',
      typefile: map['typefile'] ?? '',
      isfollow: map['isfollow']?.toInt() ?? 0,
      islike: map['islike']?.toInt() ?? 0,
      komentar:
          List<Komentar>.from(map['komentar']?.map((x) => Komentar.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailPostModel.fromJson(String source) =>
      DetailPostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailPostModel(id: $id, username: $username, userid: $userid, name: $name, profile_picture: $profile_picture, type: $type, title: $title, image: $image, caption: $caption, hashtag: $hashtag, location: $location, created_at: $created_at, history: $history, likes: $likes, dislikes: $dislikes, typefile: $typefile, isfollow: $isfollow, islike: $islike, komentar: $komentar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailPostModel &&
        other.id == id &&
        other.username == username &&
        other.userid == userid &&
        other.name == name &&
        other.profile_picture == profile_picture &&
        other.type == type &&
        other.title == title &&
        other.image == image &&
        other.caption == caption &&
        other.hashtag == hashtag &&
        other.location == location &&
        other.created_at == created_at &&
        other.history == history &&
        other.likes == likes &&
        other.dislikes == dislikes &&
        other.typefile == typefile &&
        other.isfollow == isfollow &&
        other.islike == islike &&
        listEquals(other.komentar, komentar);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        userid.hashCode ^
        name.hashCode ^
        profile_picture.hashCode ^
        type.hashCode ^
        title.hashCode ^
        image.hashCode ^
        caption.hashCode ^
        hashtag.hashCode ^
        location.hashCode ^
        created_at.hashCode ^
        history.hashCode ^
        likes.hashCode ^
        dislikes.hashCode ^
        typefile.hashCode ^
        isfollow.hashCode ^
        islike.hashCode ^
        komentar.hashCode;
  }
}

class Komentar {
  final String comment;
  final String username;
  final String profile_picture;
  Komentar({
    required this.comment,
    required this.username,
    required this.profile_picture,
  });

  Komentar copyWith({
    String? comment,
    String? username,
    String? profile_picture,
  }) {
    return Komentar(
      comment: comment ?? this.comment,
      username: username ?? this.username,
      profile_picture: profile_picture ?? this.profile_picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'comment': comment});
    result.addAll({'username': username});
    result.addAll({'profile_picture': profile_picture});

    return result;
  }

  factory Komentar.fromMap(Map<String, dynamic> map) {
    return Komentar(
      comment: map['comment'] ?? '',
      username: map['username'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Komentar.fromJson(String source) =>
      Komentar.fromMap(json.decode(source));

  @override
  String toString() =>
      'Komentar(comment: $comment, username: $username, profile_picture: $profile_picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Komentar &&
        other.comment == comment &&
        other.username == username &&
        other.profile_picture == profile_picture;
  }

  @override
  int get hashCode =>
      comment.hashCode ^ username.hashCode ^ profile_picture.hashCode;
}