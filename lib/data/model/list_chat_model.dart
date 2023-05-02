import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListChatModel {
  final String status;
  final List<Data> data;
  ListChatModel({
    required this.status,
    required this.data,
  });

  ListChatModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ListChatModel(
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

  factory ListChatModel.fromMap(Map<String, dynamic> map) {
    return ListChatModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListChatModel.fromJson(String source) =>
      ListChatModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListChatModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListChatModel &&
        other.status == status &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String id;
  final String name;
  final String type;
  final String creator;
  final String created_at;
  Data({
    required this.id,
    required this.name,
    required this.type,
    required this.creator,
    required this.created_at,
  });

  Data copyWith({
    String? id,
    String? name,
    String? type,
    String? creator,
    String? created_at,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      creator: creator ?? this.creator,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'type': type});
    result.addAll({'creator': creator});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      creator: map['creator'] ?? '',
      created_at: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, name: $name, type: $type, creator: $creator, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.creator == creator &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        creator.hashCode ^
        created_at.hashCode;
  }
}
