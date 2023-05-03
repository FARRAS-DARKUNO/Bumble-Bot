import 'dart:convert';

class CreateChatRoomModel {
  final String status;
  final String message;
  final int room_id;
  CreateChatRoomModel({
    required this.status,
    required this.message,
    required this.room_id,
  });

  CreateChatRoomModel copyWith({
    String? status,
    String? message,
    int? room_id,
  }) {
    return CreateChatRoomModel(
      status: status ?? this.status,
      message: message ?? this.message,
      room_id: room_id ?? this.room_id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'room_id': room_id});

    return result;
  }

  factory CreateChatRoomModel.fromMap(Map<String, dynamic> map) {
    return CreateChatRoomModel(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      room_id: map['room_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateChatRoomModel.fromJson(String source) =>
      CreateChatRoomModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CreateChatRoomModel(status: $status, message: $message, room_id: $room_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateChatRoomModel &&
        other.status == status &&
        other.message == message &&
        other.room_id == room_id;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ room_id.hashCode;
}
