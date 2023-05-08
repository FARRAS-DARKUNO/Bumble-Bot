import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListTokenModel {
  final String status;
  final List<Data> data;
  ListTokenModel({
    required this.status,
    required this.data,
  });

  ListTokenModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ListTokenModel(
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

  factory ListTokenModel.fromMap(Map<String, dynamic> map) {
    return ListTokenModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListTokenModel.fromJson(String source) =>
      ListTokenModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListTokenModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListTokenModel &&
        other.status == status &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final String id;
  final String nametoken;
  final String wallet;
  final String reputation;
  final String kyc;
  final String creation_date;
  Data({
    required this.id,
    required this.nametoken,
    required this.wallet,
    required this.reputation,
    required this.kyc,
    required this.creation_date,
  });

  Data copyWith({
    String? id,
    String? nametoken,
    String? wallet,
    String? reputation,
    String? kyc,
    String? creation_date,
  }) {
    return Data(
      id: id ?? this.id,
      nametoken: nametoken ?? this.nametoken,
      wallet: wallet ?? this.wallet,
      reputation: reputation ?? this.reputation,
      kyc: kyc ?? this.kyc,
      creation_date: creation_date ?? this.creation_date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nametoken': nametoken});
    result.addAll({'wallet': wallet});
    result.addAll({'reputation': reputation});
    result.addAll({'kyc': kyc});
    result.addAll({'creation_date': creation_date});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      nametoken: map['nametoken'] ?? '',
      wallet: map['wallet'] ?? '',
      reputation: map['reputation'] ?? '',
      kyc: map['kyc'] ?? '',
      creation_date: map['creation_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, nametoken: $nametoken, wallet: $wallet, reputation: $reputation, kyc: $kyc, creation_date: $creation_date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.nametoken == nametoken &&
        other.wallet == wallet &&
        other.reputation == reputation &&
        other.kyc == kyc &&
        other.creation_date == creation_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nametoken.hashCode ^
        wallet.hashCode ^
        reputation.hashCode ^
        kyc.hashCode ^
        creation_date.hashCode;
  }
}
