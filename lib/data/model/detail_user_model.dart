import 'dart:convert';

import 'package:flutter/foundation.dart';

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
  final List<Post> posts;
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
    required this.posts,
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
    List<Post>? posts,
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
      posts: posts ?? this.posts,
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
    result.addAll({'posts': posts.map((x) => x.toMap()).toList()});

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
      posts: List<Post>.from(map['posts']?.map((x) => Post.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, email: $email, name: $name, username: $username, followers: $followers, following: $following, profile_picture: $profile_picture, wallet: $wallet, created_at: $created_at, isfollow: $isfollow, posts: $posts)';
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
        other.isfollow == isfollow &&
        listEquals(other.posts, posts);
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
        isfollow.hashCode ^
        posts.hashCode;
  }
}

class Post {
  final String id;
  final String user_id;
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
  Post({
    required this.id,
    required this.user_id,
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
  });

  Post copyWith({
    String? id,
    String? user_id,
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
  }) {
    return Post(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
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
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'user_id': user_id});
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

    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      user_id: map['user_id'] ?? '',
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, user_id: $user_id, type: $type, title: $title, image: $image, caption: $caption, hashtag: $hashtag, location: $location, created_at: $created_at, history: $history, likes: $likes, dislikes: $dislikes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.user_id == user_id &&
        other.type == type &&
        other.title == title &&
        other.image == image &&
        other.caption == caption &&
        other.hashtag == hashtag &&
        other.location == location &&
        other.created_at == created_at &&
        other.history == history &&
        other.likes == likes &&
        other.dislikes == dislikes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        type.hashCode ^
        title.hashCode ^
        image.hashCode ^
        caption.hashCode ^
        hashtag.hashCode ^
        location.hashCode ^
        created_at.hashCode ^
        history.hashCode ^
        likes.hashCode ^
        dislikes.hashCode;
  }
}
