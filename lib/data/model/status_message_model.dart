import 'dart:convert';

class StatusMessageModel {
  final String status;
  final String message;
  StatusMessageModel({
    required this.status,
    required this.message,
  });

  StatusMessageModel copyWith({
    String? status,
    String? message,
  }) {
    return StatusMessageModel(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'message': message});

    return result;
  }

  factory StatusMessageModel.fromMap(Map<String, dynamic> map) {
    return StatusMessageModel(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusMessageModel.fromJson(String source) =>
      StatusMessageModel.fromMap(json.decode(source));

  @override
  String toString() => 'StatusMessageModel(status: $status, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatusMessageModel &&
        other.status == status &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
