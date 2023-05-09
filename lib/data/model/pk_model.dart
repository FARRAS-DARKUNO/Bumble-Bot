import 'dart:convert';

class PKMModel {
  final String status;
  final Data data;
  PKMModel({
    required this.status,
    required this.data,
  });

  PKMModel copyWith({
    String? status,
    Data? data,
  }) {
    return PKMModel(
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

  factory PKMModel.fromMap(Map<String, dynamic> map) {
    return PKMModel(
      status: map['status'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PKMModel.fromJson(String source) =>
      PKMModel.fromMap(json.decode(source));

  @override
  String toString() => 'PKMModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PKMModel && other.status == status && other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String email;
  final String private_key;
  Data({
    required this.email,
    required this.private_key,
  });

  Data copyWith({
    String? email,
    String? private_key,
  }) {
    return Data(
      email: email ?? this.email,
      private_key: private_key ?? this.private_key,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'private_key': private_key});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      email: map['email'] ?? '',
      private_key: map['private_key'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(email: $email, private_key: $private_key)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.email == email &&
        other.private_key == private_key;
  }

  @override
  int get hashCode => email.hashCode ^ private_key.hashCode;
}
