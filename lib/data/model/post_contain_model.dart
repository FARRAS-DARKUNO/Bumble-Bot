import 'dart:convert';

class PostContainModel {
  final String id;
  final String username;
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
  PostContainModel({
    required this.id,
    required this.username,
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
  });

  PostContainModel copyWith({
    String? id,
    String? username,
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
  }) {
    return PostContainModel(
      id: id ?? this.id,
      username: username ?? this.username,
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
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'username': username});
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

    return result;
  }

  factory PostContainModel.fromMap(Map<String, dynamic> map) {
    return PostContainModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
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
    );
  }

  String toJson() => json.encode(toMap());

  factory PostContainModel.fromJson(String source) =>
      PostContainModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostContainModel(id: $id, username: $username, name: $name, profile_picture: $profile_picture, type: $type, title: $title, image: $image, caption: $caption, hashtag: $hashtag, location: $location, created_at: $created_at, history: $history, likes: $likes, dislikes: $dislikes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostContainModel &&
        other.id == id &&
        other.username == username &&
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
        other.dislikes == dislikes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
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
        dislikes.hashCode;
  }
}
