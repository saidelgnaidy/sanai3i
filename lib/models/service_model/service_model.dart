import 'dart:convert';

class ServiceModel {
  final String nameAr;
  final String nameEn;
  final ServiceType? type;
  final String? id;
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

abstract class ServiceType {
  static const ServiceType job = _JobType();
  static const ServiceType shop = _ShopType();
  static const ServiceType transport = _TransportType();
  const ServiceType();

  factory ServiceType.fromStr(String str) {
    if (str == ServiceType.job.toString()) {
      return ServiceType.job;
    }
    if (str == ServiceType.shop.toString()) {
      return ServiceType.shop;
    }
    if (str == ServiceType.transport.toString()) {
      return ServiceType.transport;
    }
    return ServiceType.job;
  }
}

class _JobType extends ServiceType {
  const _JobType();
  @override
  String toString() {
    return 'Job';
  }
}

class _ShopType extends ServiceType {
  const _ShopType();
  @override
  String toString() {
    return 'Shop';
  }
}

class _TransportType extends ServiceType {
  const _TransportType();
  @override
  String toString() {
    return 'Transport';
  }
}
