import 'dart:convert';

class ListUserModel {
  final String username;
  final String name;
  final String profile_picture;
  ListUserModel({
    required this.username,
    required this.name,
    required this.profile_picture,
  });

  ListUserModel copyWith({
    String? username,
    String? name,
    String? profile_picture,
  }) {
    return ListUserModel(
      username: username ?? this.username,
      name: name ?? this.name,
      profile_picture: profile_picture ?? this.profile_picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'name': name});
    result.addAll({'profile_picture': profile_picture});

    return result;
  }

  factory ListUserModel.fromMap(Map<String, dynamic> map) {
    return ListUserModel(
      username: map['username'] ?? '',
      name: map['name'] ?? '',
      profile_picture: map['profile_picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ListUserModel.fromJson(String source) =>
      ListUserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ListUserModel(username: $username, name: $name, profile_picture: $profile_picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListUserModel &&
        other.username == username &&
        other.name == name &&
        other.profile_picture == profile_picture;
  }

  @override
  int get hashCode =>
      username.hashCode ^ name.hashCode ^ profile_picture.hashCode;
}
