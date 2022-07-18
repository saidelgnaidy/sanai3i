import 'dart:convert';

import 'package:sanai3i/models/service_model/service_type.dart';

class ServiceModel {
  final String nameAr;
  final String nameEn;
  final String? id;
  final ServiceType? type;
  ServiceModel({required this.nameAr, required this.nameEn, this.type, this.id});

  ServiceModel copyWith({String? nameAr, String? nameEn, ServiceType? type, String? id}) {
    return ServiceModel(
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      type: type ?? this.type,
      id: id ?? id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nameAr': nameAr});
    result.addAll({'nameEn': nameEn});
    if (type != null) {
      result.addAll({'type': type.toString()});
    }
    if (id != null) {
      result.addAll({'uid': id});
    }

    return result;
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      nameAr: map['nameAr'] ?? '',
      nameEn: map['nameEn'] ?? '',
      type: map['type'] != null ? ServiceType.fromStr(map['type']) : null,
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) => ServiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceModel(nameAr: $nameAr, nameEn: $nameEn, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceModel && other.nameAr == nameAr && other.nameEn == nameEn && other.type == type && other.id == id;
  }

  @override
  int get hashCode {
    return nameAr.hashCode ^ nameEn.hashCode ^ type.hashCode ^ id.hashCode;
  }
}
